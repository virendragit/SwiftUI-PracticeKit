//
//  AzureBlobUploader.swift
//  Blob_Upload_Poc
//
//  Created by Virendra Gupta on 15/09/25.
//

import Foundation

class AzureBlobUploader{
    
    static let shared = AzureBlobUploader()
    
    func upload(data: Data, fileName: String){
        // Construct URL, headers and perform upload using URL session or azure SDK
    }
}
