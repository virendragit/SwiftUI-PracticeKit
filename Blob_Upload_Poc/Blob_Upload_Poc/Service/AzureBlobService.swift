//
//  AzureBlobService.swift
//  Blob_Upload_Poc
//
//  Created by Virendra Gupta on 15/09/25.
//

import Foundation

class AzureBlobService {
    static let shared = AzureBlobService()

    private let containerUrl = "https://<your-storage-account>.blob.core.windows.net/<your-container-name>"
    private let sasToken = "<your-SAS-token>" // Starts with ?sv=...

    func upload(imageData: Data, blobName: String) {
        let uploadUrlString = "\(containerUrl)/\(blobName)\(sasToken)"
        guard let uploadUrl = URL(string: uploadUrlString) else {
            print("Invalid upload URL")
            return
        }

        var request = URLRequest(url: uploadUrl)
        request.httpMethod = "PUT"
        request.setValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        request.setValue("\(imageData.count)", forHTTPHeaderField: "Content-Length")

        let task = URLSession.shared.uploadTask(with: request, from: imageData) { data, response, error in
            if let error = error {
                print("Upload failed: \(error)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Upload completed with status: \(httpResponse.statusCode)")
            }
        }
        task.resume()
    }
}

