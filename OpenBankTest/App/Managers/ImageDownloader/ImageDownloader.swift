//
//  ImageDownloader.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit

class ImageDownloader {

	static var shared: ImageDownloader = {
		let instance = ImageDownloader()
		return instance
	}()

	/// Downlaod image from BEND service thoughout URL
	/// - Parameters:
	///  - imageURLString: String of the Image `URL`
	///  - completion: Closure that returns a value with the UIImage data
	func downloadImage(imageURLString: String, completion: @escaping (Data?) -> ()) {
		if let secureImage = URL(string: imageURLString) {
			URLSession.shared.dataTask(with: URLRequest(url: secureImage)) { data, response, error in

				// secure the error and data
				if let data = data, error == nil  {
					Debugger.printLog(.debug, message: "\(response?.suggestedFilename ?? secureImage.lastPathComponent)")

					DispatchQueue.main.async {
						completion(data)
					}
				}
				completion(nil)

			}.resume()
		}
		completion(nil)

	}


}
