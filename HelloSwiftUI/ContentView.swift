//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    let hikes = [
        Hike(name:"Salmoberry Trails",photo: "sal",miles: 6 ),
        Hike(name:"Mountain Trails",photo: "sul",miles: 6.8 ),
        Hike(name:"Tamnawas Trails",photo: "tal",miles: 10 )
    ]
    
    var body: some View {
        NavigationStack{
            List(hikes){hike in
                NavigationLink(value: hike){
                    HikeCellView(hike: hike)
                }
                
            }.navigationTitle("Hikes")
                .navigationDestination(for: Hike.self) { hike in
                    HikeDetailsView(hike : hike)
                }
        }
        
        VStack(spacing :15) {
            //            AsyncImage(url:URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmkjIjXMhnBoDujSj2HvHuFx2A0jDRrB89Uw&s")!){image in
            //                image.resizable()
            //            }placeholder:{
            //                ProgressView("loading...")
            //            }
            //            Image("sample")
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            //                .clipShape(Circle())
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundStyle(.tint)
            //            Text("Line 1")
            //                .foregroundStyle(.green)
            //                .font(.title3)
            //            Text("Line 2")
            //                .foregroundStyle(.red)
            //            Text("Line 3")
            //                .foregroundStyle(.yellow)
            //            Text("Line 4")
            //                .foregroundStyle(.blue)
            
            //            .padding()
            //
            //        }
            
            // .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct HikeCellView: View {
    
    let hike: Hike
    
    var body: some View {
        HStack(alignment: .top) {
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                .frame(width: 100)
            
            VStack(alignment: .leading) {
                Text(hike.name)
                    .multilineTextAlignment(.leading)
                Text("Distance:\(hike.miles.formatted()) miles")
            }
        }
    }
}
