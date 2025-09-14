//
//  ContentView.swift
//  MV_Sample
//
//  Created by Virendra Gupta on 14/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    private func populateProducts() async  {
        do{
            try await storeModel.populateProducts()
        }
        catch{
            print("Error")
        }
    }
    
    var body: some View {
        VStack{
            List(storeModel.products){product in
                Text(product.title)
            }
        }.task {
            await populateProducts()
        }
    }
}

#Preview {
    ContentView().environmentObject(StoreModel(webService: WebServices()))
}
