//
//  ContentView.swift
//  Blob_Upload_Poc
//
//  Created by Virendra Gupta on 15/09/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @StateObject private var viewModel :ImageUploadViewModel
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []

    var body: some View {
        
        VStack(spacing: 20) {
                    Button("Upload Image") {
//                        viewModel.uploadImage(named: "yourImageName") // Replace with actual asset name
                    }
                }
        VStack {
            if selectedImages.isEmpty {
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundStyle(.gray)
                Text("No images selected")
                    .font(.caption)
                    .foregroundColor(.secondary)
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(selectedImages.indices, id: \.self) { index in
                            selectedImages[index]
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                        }
                    }
                }
            }

            PhotosPicker(
                "Select Images",
                selection: $selectedItems,
                maxSelectionCount: 5,
                matching: .images
            )
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .onChange(of: selectedItems) {_ ,newItems in
            Task {
                selectedImages.removeAll()
                for item in newItems {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImages.append(Image(uiImage: uiImage))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
