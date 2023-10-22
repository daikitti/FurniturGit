//
//  ProfileViewModel.swift
//  furniture
//
//  Created by Have Dope on 15.04.2023.
//

import Foundation


class ProfileViewModel: ObservableObject{
    
    @Published var profile: MVUser

    init(profile: MVUser) {
        self.profile = profile
    }
    
    func setProfile(){
        
        DataBaseService.shared.setProfile(user: self.profile) { result in
            switch result{
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("ошибка отправки данных \(error.localizedDescription)")
            }
        }
        
    }
   
    
}
