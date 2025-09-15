//
//  ImageUploadViewModel.swift
//  Blob_Upload_Poc
//
//  Created by Virendra Gupta on 15/09/25.
//

import Foundation
import UIKit

class ImageUploadViewModel {
    func uploadImage(named imageName: String) {
        guard let image = UIImage(named: imageName),
              let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("Image conversion failed")
            return
        }

        let blobName = "\(UUID().uuidString).jpg"
        AzureBlobService.shared.upload(imageData: imageData, blobName: blobName)
    }
}

