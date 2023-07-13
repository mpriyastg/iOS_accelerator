//
//  FilemanagerhelperC.swift
//  InterviewSwiftUI
//
//  Created by admin on 05/06/23.
//

import Foundation
import SwiftUI

final class FileManagerHelper {
    func readImageFromDocumentsDirectory(filename: String) -> Image? {
        let fileURL = FileManager.default.urls(for: .documentDirectory,
                                               in: .userDomainMask)[0].appendingPathComponent(filename)
        do {
            let imageData = try Data(contentsOf: fileURL)
            let uiImage = UIImage(data: imageData)
            if let unwrappedImage = uiImage {
                let image = Image(uiImage: unwrappedImage)
                return image
            }
        } catch {
            print("Error reading image: \(error)")
        }

        return nil
    }
    func readTextFromDocumentsDirectory(filename: String) -> String? {
        let fileURL = FileManager.default.urls(for: .documentDirectory,
                                               in: .userDomainMask)[0].appendingPathComponent(filename)

        do {
            let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
            return fileContents
        } catch {
            print("Error reading file: \(error)")
        }

        return nil
    }
    func readJSONFromDocumentsDirectory<T: Decodable>(filename: String, type: T.Type) -> T? {
        // Get the file URL for the document directory
        let fileURL = FileManager.default.urls(for: .documentDirectory,
                                               in: .userDomainMask)[0].appendingPathComponent(filename)

        do {
            // Read the contents of the file as Data
            let jsonData = try Data(contentsOf: fileURL)

            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()

            // Decode the JSON data into the specified type
            let decodedData = try decoder.decode(type, from: jsonData)

            // Return the decoded data
            return decodedData
        } catch {
            // Handle any errors that occur during reading or decoding
            print("Error reading JSON file: \(error)")
        }

        // Return nil if there was an error
        return nil
    }

}
extension Bundle {
    // MARK: - json reader from bundle
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return decodedData
    }
    // MARK: - text reader from bundle
    func decodeTEXT<T: LosslessStringConvertible>(_ file: String, withExtension fileExtension: String) -> T? {
        guard let url = self.url(forResource: file, withExtension: fileExtension) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let text = try? String(contentsOf: url, encoding: .utf8) else {
            fatalError("Failed to load \(file) from bundle")
        }
        guard let value = T(text) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return value
    }
    // MARK: - Rtf reader from bundle

    func decodeRTF(_ file: String) -> NSAttributedString? {
        guard let url = self.url(forResource: file, withExtension: "rtf") else {
            fatalError("Failed to locate \(file) in bundle")
        }

        do {
            let attributedString = try NSAttributedString(url: url, options: [:], documentAttributes: nil)
            return attributedString
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error)")
        }
    }
}
