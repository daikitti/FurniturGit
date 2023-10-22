//
//  pizzaShopApp.swift
//  pizzaShop
//
//  Created by Have Dope on 07.03.2023.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct furenitureApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        
        WindowGroup {
            AuthView()

        }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate{
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            
            FirebaseApp.configure()
            print("Ok ")
            
            return true
        }
        
        
    }
    

    

