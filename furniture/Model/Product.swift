//
//  Model.swift
//  furniture
//
//  Created by Have Dope on 06.04.2023.
//

import Foundation
import SwiftUI

struct Product:Identifiable{
    let id = UUID().uuidString
    
    let title: String
    var price: Int
    var imgeName: String
    var count: Int
    var shadowColor: Color
    
  
    
    static let chairs = [
        Product(title: "Begie chair", price: 7000, imgeName: "Begiechair", count: 1, shadowColor: .black),
        Product(title: "Blue chair", price: 15000, imgeName: "Stul", count: 1, shadowColor: .blue),
        Product(title: "Padded stool", price: 6800, imgeName: "paddedStool", count: 1, shadowColor: .brown),
        Product(title: "Gray chair", price: 4200, imgeName: "graychair", count: 1, shadowColor: .black ),
        
        Product(title: "Begie chair", price: 7000, imgeName: "Begiechair", count: 1, shadowColor: .black),
        Product(title: "Blue chair", price: 15000, imgeName: "Stul", count: 1, shadowColor: .blue),
        Product(title: "Padded stool", price: 6800, imgeName: "paddedStool", count: 1, shadowColor: .brown),
        Product(title: "Gray chair", price: 4200, imgeName: "graychair", count: 1, shadowColor: .black )

    ]
    
    static let sofa = [
    
    
        Product(title: "Yellow Sofa", price: 10500, imgeName: "YellowSofa", count: 1, shadowColor: .yellow),
        Product(title: "Emerald Sofa", price: 2500, imgeName: "emeraldSofa", count: 1, shadowColor: .green),
        Product(title: "Black Sofa", price: 4500, imgeName: "blacksofa", count: 1, shadowColor: .black),

        Product(title: "Yellow Sofa", price: 10500, imgeName: "YellowSofa", count: 1, shadowColor: .yellow),
        Product(title: "Emerald Sofa", price: 2500, imgeName: "emeraldSofa", count: 1, shadowColor: .green),
        Product(title: "Black Sofa", price: 4500, imgeName: "blacksofa", count: 1, shadowColor: .black),

        Product(title: "Yellow Sofa", price: 10500, imgeName: "YellowSofa", count: 1, shadowColor: .yellow),
        Product(title: "Emerald Sofa", price: 2500, imgeName: "emeraldSofa", count: 1, shadowColor: .green),
        Product(title: "Black Sofa", price: 4500, imgeName: "blacksofa", count: 1, shadowColor: .black),

    
    ]
    
}
