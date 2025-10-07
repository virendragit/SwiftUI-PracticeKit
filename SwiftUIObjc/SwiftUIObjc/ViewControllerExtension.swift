//
//  ViewControllerExtension.swift
//  SwiftUIObjc
//
//  Created by Virendra Gupta on 07/10/25.
//

import Foundation

import SwiftUI

@objc extension ViewController {
    func displaySwiftUIWrapper() {
//        let hostingVC = UIHostingController(rootView: SwiftUIView())
        let hostingVC = UIHostingController(rootView: ContentView1())
        hostingVC.modalPresentationStyle = .fullScreen
        
        self.present(hostingVC, animated: true)
        
    }
    
}

struct SwiftUIView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("SwiftUI View")
        
        Button{
            self.dismiss()
        } label: {
            Text("dissmiss the view!")
        }
    }
}

struct NoInternetView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)

            Text("No Internet Connection")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            Text("Please check your Wi-Fi or mobile data settings and try again.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: {
                // Retry action
            }) {
                Text("Retry")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct ContentView1: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            NoInternetView()
                //.navigationTitle("Dashboard")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            // Back action
                            self.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.blue)
                                .accessibilityLabel("Back")
                        }

                        Image(systemName: "wifi.slash")
                            .foregroundColor(.red)
                            .accessibilityLabel("Offline")
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
