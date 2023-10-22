//
//  MainTabBarViewModel.swift
//  furniture
//
//  Created by Have Dope on 18.04.2023.
//

import Foundation
import FirebaseAuth
import Firebase


class MainTabBarViewModel:ObservableObject {
    
    @Published var user: User
    init (user: User){
        self.user = user
    }
    
    
}
