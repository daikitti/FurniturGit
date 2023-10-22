//
//  CorsinaCell.swift
//  furniture
//
//  Created by Have Dope on 09.04.2023.
//

import SwiftUI

struct CorsinaCell: View {
    
    var position: Product
    
    var body: some View {
        HStack {
            Text(position.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count)")
            Text("₽\(position.price)")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}
struct CorsinaCell_Previews: PreviewProvider {
    static var previews: some View {
        CorsinaCell(position: Product(title: "Sofa", price: 3500, imgeName: "", count: 1, shadowColor: .green))
    }
}
