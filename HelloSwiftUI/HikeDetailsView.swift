//
//  HikeDetailsView.swift
//  HelloSwiftUI
//
//  Created by Virendra Gupta on 03/07/25.
//

import SwiftUI

struct HikeDetailsView: View {
    let hike : Hike
    @State private var zoomed : Bool = false
    
    var body: some View {
        VStack{
            Image(hike.photo)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
            Text("Distance:\(hike.miles)")
            Spacer()
        }.navigationTitle(hike.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        HikeDetailsView(hike: Hike(name:"Salmoberry Trails",photo: "sal",miles: 6))
    }
    
}
