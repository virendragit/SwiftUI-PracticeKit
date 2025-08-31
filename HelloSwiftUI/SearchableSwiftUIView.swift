//
//  SearchableSwiftUIView.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 03/07/25.
//

import SwiftUI

struct SearchableSwiftUIView: View {
    
    @State private var searchText: String = ""
    @State private var friends: [String] = ["new","john","doe","alice","green"]
    
    @State private var filteredFriends : [String] = []
    
    var body: some View {
        VStack{
            List(filteredFriends, id:\.self){friend in
                Text(friend)
                
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                if searchText.isEmpty {
                    filteredFriends = friends
                    
                }else{
                    filteredFriends = friends.filter { $0.lowercased().contains(searchText.lowercased()) }
                }
            }
            Spacer()
        }.padding()
            .onAppear(perform: {
                filteredFriends = friends
            })
         .navigationTitle("Friends")
    }
}

#Preview {
    NavigationStack{
        SearchableSwiftUIView()
    }
}
