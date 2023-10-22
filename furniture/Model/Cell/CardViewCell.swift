//
//  CardView.swift
//  furniture
//
//  Created by Have Dope on 07.04.2023.
//

import SwiftUI

struct CardView: View {
        
    var item: Product
    @State private var isTaped = false
    

    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.black)
                
            HStack(alignment: .center) {
                Spacer()
                Image(item.imgeName)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                Spacer()
            }
            
            HStack {
                Text("\(item.price)")
                    .font(.system(size: 15,weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: isTaped ?  "heart.fill" : "heart" ) 
                    .onTapGesture {
                        
                        isTaped.toggle()
                    }
            }
        }.padding()
            .background(.white)
            .frame(width: 270, height: 280)
            .cornerRadius(20)
            .shadow(color: item.shadowColor.opacity(0.3), radius: 20, y: 20)
            .animation(.easeIn(duration: 0.5), value: isTaped)
                
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(item: Product(title: "Emerald Sofa", price: 2500, imgeName: "emeraldSofa", count: 1, shadowColor: .green)
)
    }
}
