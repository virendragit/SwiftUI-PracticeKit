//
//  LoginView.swift
//  Navigations
//
//  Created by Virendra Gupta on 22/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var loginFailed = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button("Login") {
                    if username == "admin" && password == "1234" {
                        isLoggedIn = true
                        loginFailed = false
                    } else {
                        loginFailed = true
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

//                if loginFailed {
//                    Text("Invalid credentials. Try again.")
//                        .foregroundColor(.red)
//                }
            }
            .padding()
            .navigationTitle("Login")
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView1()
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Welcome to the Home Screen!")
            .font(.title)
            .navigationTitle("Home")
    }
}




#Preview {
    LoginView()
}
