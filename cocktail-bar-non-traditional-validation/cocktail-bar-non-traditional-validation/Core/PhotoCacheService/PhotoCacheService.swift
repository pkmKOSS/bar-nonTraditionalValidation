//
//  PhotoCacheService.swift
//  cocktail-bar-non-traditional-validation
//
//  Created by Григоренко Александр Игоревич on 23.12.2022.
//

import Alamofire
import UIKit

/// Cервис кэширования фото
final class PhotoCacheService {
    // MARK: - Constants

    private enum Constants {
        static let reverseSlash: Character = "/"
        static let pathName = "Images"
        static let defaultName: Substring = "default"
        static let cacheLifeTime = 30.0 * 24.0 * 60.0 * 60.0
        static let emptyString = ""
        static let pngFormate = ".png"
    }

    // MARK: - Private properties

    private static let pathName: String = { let pathName = Constants.pathName
        guard let directory = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first else {
            return pathName
        }
        let url = directory.appendingPathComponent(
            pathName,
            isDirectory: true
        )
        guard !FileManager.default.fileExists(atPath: url.path) else { return Constants.emptyString }

        try? FileManager.default.createDirectory(
            at: url,
            withIntermediateDirectories: true,
            attributes: nil
        )

        return pathName
    }()
    private let cacheLifeTime: TimeInterval = Constants.cacheLifeTime
    private var photoMap = [String: UIImage]()

    // MARK: - Public Methods

    func photo(byUrl url: String) -> UIImage? {
        var image: UIImage?
        if let photo = photoMap[url] {
            image = photo
        } else if let photo = getImageFromCache(url: url) {
            image = photo
        } else {
            downloadPhoto(byUrl: url)
        }
        return image
    }

    // MARK: - Private methods

    private func makeFilePath(url: String) -> String? {
        guard let cachesDirectory = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first else {
            return nil
        }
        let hashName = url.split(separator: Constants.reverseSlash).last ?? Constants.defaultName
        return cachesDirectory.appendingPathComponent(
            "\(PhotoCacheService.pathName)\(String(Constants.reverseSlash))\(hashName)\(Constants.pngFormate)"
        ).path
    }

    private func casheImage(url: String, image: UIImage) {
        guard
            let fileName = makeFilePath(url: url),
            let data = image.pngData()
        else { return }
        FileManager.default.createFile(
            atPath: fileName,
            contents: data,
            attributes: nil
        )
    }

    private func downloadPhoto(byUrl url: String) {
        AF.request(url).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.data,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.photoMap[url] = image
            }
            self.casheImage(url: url, image: image)
        }
    }

    private func getImageFromCache(url: String) -> UIImage? {
        guard
            let fileName = makeFilePath(url: url),
            let info = try? FileManager.default.attributesOfItem(atPath: fileName),
            let changeDate = info[FileAttributeKey.modificationDate] as? Date
        else {
            return nil
        }
        let lifeTime = Date().timeIntervalSince(changeDate)
        guard
            lifeTime <= cacheLifeTime,
            let image = UIImage(contentsOfFile: fileName)
        else {
            return nil
        }
        DispatchQueue.main.async {
            self.photoMap[url] = image
        }
        return image
    }
}
