//
//  CorsinaModel.swift
//  furniture
//
//  Created by Have Dope on 09.04.2023.
//

import Foundation


class CorsinaModel: ObservableObject, Identifiable{
    
    static var shared = CorsinaModel()
     
     private init(){     }
     
     var cost: Int {
         var sum  = 0
         
         for pos in positions {
             sum += pos.count * pos.price
         }
         return sum
     }
    
    @Published var positions = [Product]()
    
    func addPosition(_ position: Product){
        self.positions.append(position)
    }

}
