//
//  MVUser.swift
//  furniture
//
//  Created by Have Dope on 15.04.2023.
//

import Foundation


struct MVUser: Identifiable {
    
    var id: String
    var email: String
    var name: String
    var phone: String
   
    var adres: String
    
    var representation: [String:Any] {
        var repres = [String:Any]()
        repres["id"] = self.id
        repres["email"] = self.email
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["adres"] = self.adres

        return repres
          
    }
    
    
    
    
}
