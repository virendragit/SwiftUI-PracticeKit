//
//  ContentView.swift
//  Blob_Upload_Poc
//
//  Created by Virendra Gupta on 15/09/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []

    var body: some View {
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
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                        }
                    }
                }
            }

            PhotosPicker(
                "Select Images",
                selection: $selectedItems,
                maxSelectionCount: 5, // Optional: limit selection
                matching: .images
            )
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .onChange(of: selectedItems) { newItems in
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


//struct ContentView: View {
//    
//    @State private var selectedItem: PhotosPickerItem? = nil
//    @State private var selectedImage: Image? = nil
//    
//    var body: some View {
//            VStack {
//                if let image = selectedImage {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//                } else {
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundStyle(.tint)
//                }
//
//                Text("Hello, world!")
//
//                PhotosPicker("Select Photo", selection: $selectedItem, matching: .images)
//                    .buttonStyle(.borderedProminent)
//                    .padding()
//            }
//            .padding()
//            .onChange(of: selectedItem ?? <#default value#>) { newItem in
//                Task {
//                    if let data = try? await newItem.loadTransferable(type: Data.self),
//                       let uiImage = UIImage(data: data) {
//                        selectedImage = Image(uiImage: uiImage)
//                    }
//                }
//            }
//        }
//}

#Preview {
    ContentView()
}
