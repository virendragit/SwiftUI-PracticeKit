//
//  ContentView.swift
//  MVVMSample
//
//  Created by Virendra Gupta on 14/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webservice: WebServices())
    
    var body: some View {
       
        List(vm.products) { product in
            Text(product.title)
        }.task {
            await vm.populateProducts()
        }
    }
}

#Preview {
    ContentView()
}
