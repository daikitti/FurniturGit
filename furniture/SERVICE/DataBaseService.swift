//
//  DataBaseService.swift
//  furniture
//
//  Created by Have Dope on 15.04.2023.
//

import Foundation
import Firebase
import FirebaseFirestore



class DataBaseService {
    
    static let shared = DataBaseService()
    
    private let db = Firestore.firestore()
    private var usersRef: CollectionReference{
        return db.collection("Users")
    }
    private init() {}
    
    func setProfile(user: MVUser, completion: @escaping (Result<MVUser, Error>) -> ())      {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error{
                completion(.failure(error))
            }else{
                completion(.success(user))
                
            }
        }
        
    }
    
    
    
}
