//
//  ImageDownloader.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit

class ImageDownloader {

	/// Downlaod image from BEND service thoughout URL
	/// - Parameters:
	///  - completion: Closure that returns a value with the UIImage data
	static func downloadImage(completion: @escaping(UIImage?) -> ()) {

		if let secureImage = self.imageUrl {
			// make request in background
			DispatchQueue.global(qos: .background).async {
				URLSession.shared.dataTask(with: URLRequest(url: secureImage)) { data, response, error in

					// secure the error and data
					if let data = data, error == nil  {
						Debugger.printLog(.debug, message: "\(response?.suggestedFilename ?? secureImage.lastPathComponent)")

						DispatchQueue.main.async {
							completion(UIImage(data: data))
						}
					}
					completion(nil)

				}.resume()
			}
		}
		completion(nil)

	}


}
