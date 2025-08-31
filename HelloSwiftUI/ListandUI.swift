//
//  ListandUI.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 03/07/25.
//

import SwiftUI

struct ListandUI: View {
    
    @State private var name = ""
    @State private var friends: [String] = []
    
    var body: some View {
      VStack {
            TextField("Enter your name", text: $name)
              .textFieldStyle(.roundedBorder)
              .onSubmit {
                  friends.append(name)
                  name = ""
              }
              Spacer()
            List(friends, id: \.self) { friend in
              Text(friend)
          }
        }
    }
}

#Preview {
    ListandUI()
}
