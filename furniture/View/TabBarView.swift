//
//  TabBarView.swift
//  furniture
//
//  Created by Have Dope on 09.04.2023.
//

import SwiftUI

struct TabBarView: View {
    
   var viewmodel: MainTabBarViewModel
    
    var body: some View {
        
        TabView{
            NavigationView{
                MainView()
            }.tabItem {
                VStack{
                    Image(systemName: "menucard")
                    Text("Каталог")
                }
            }
            
            Corsina(viewModel: CorsinaModel.shared)
                .tabItem {
                    ZStack{
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            
            ProfileView( viewmodel: ProfileViewModel(profile: MVUser(id: viewmodel.user.uid , email:  viewmodel.user.email!, name: "", phone: "", adres: "")))
                .tabItem {
                    ZStack{
                        Image(systemName: "person.crop.rectangle.fill")
                        Text("Профиль")
                    }
                }
        
        }
        
        
        
    }
}
