//
//  IndianHikeView.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 19/08/25.
//

import SwiftUI

//struct IndianHikeView: View {
//    
//    let indianHikes = [
//        
//        IndianHike(name:"Kedarkantha",photo: "ked",kilometer:600 ),
//        IndianHike(name:"Valley of Flowers",photo: "vof",kilometer: 500 ),
//        IndianHike(name:"Hampta Pass",photo: "hap",kilometer: 700 )
//    ]
//    
//    var body: some View {
//        NavigationStack{
//        List(indianHikes) { hike in
//            NavigationLink(value: hike){
//                IndianHikeCellView(hike : hike)
//            }
//        }.navigationTitle("IndianHikes")
//                .navigationDestination(for: Hike.self) { hike in
//                    Text(hike.name)
//                }
//    }
//       
//    }
//}
struct IndianHikeView: View {
    
   @State private var isON: Bool = true
    
    let indianHikes = [
        IndianHike(name:"Kedarkantha", photo: "ked", kilometer: 600),
        IndianHike(name:"Valley of Flowers", photo: "vof", kilometer: 500),
        IndianHike(name:"Hampta Pass", photo: "hap", kilometer: 700)
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                List(indianHikes) { hike in
                    NavigationLink(value: hike) {
                        IndianHikeCellView(hike: hike)
                    }
                }
                .frame(maxHeight: 400)
                .listStyle(.plain)
                VStack {
                    Toggle(isOn: $isON, label: {Text(isON ? "On" : "Off").foregroundStyle(.white)}).fixedSize()
                }
                
                Spacer() // Pushes content up if needed
            }.background(isON ? .yellow : .black)
            .navigationTitle("IndianHikes")
            .navigationDestination(for: IndianHike.self) { hike in
                IndianHikeDetailView(hike: hike)
                
            }
            
        }
    }
}

#Preview {
    IndianHikeView()
}

struct IndianHikeCellView: View {
    var hike : IndianHike
    var body: some View {
        HStack(alignment: .top){
            Image(hike.photo)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            VStack(alignment: .leading){
                Text(hike.name)
                Text("Hike Distance: \(hike.kilometer.formatted()) km")
            }
        }
    }
}

struct IndianHikeDetailView: View {
    var hike: IndianHike
    
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack{
            
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill :.fit)
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                    
                }
            Text(hike.name)
                .font(.title)
            Text("Kilometer is \(hike.kilometer.formatted())")
                .font(.caption2)
            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
