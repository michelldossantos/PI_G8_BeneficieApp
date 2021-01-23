//
//  LoginViewModel.swift
//  PI_G8_BeneficieApp
//
//  Created by Dominique Nascimento Bezerra on 07/12/20.
//

import Foundation

class LoginViewModel {
    
    var arrayUsers = [User]()
    
    var apiManager = APIManager()
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        apiManager.getAsArray(
            url: "https://beneficie-app.herokuapp.com/beneficie/users/") { (responseArray) in
            let decoder = JSONDecoder()
            do {
                let users = try decoder.decode([User].self, from: responseArray)
                self.arrayUsers = users
                onComplete(true)
                return
            }
            catch {
                print(error.localizedDescription)
                onComplete(false)
            }
        }
        onFailure: { (error) in
            print("Error \(error)")
            onComplete(false)
        }
    }
    
    func isAdmin(user: String) -> Bool{
        if user.contains("admin@admin") {
            return true
        } else {
            return false
        }
    }
    
    func didRegister(userLogin: String, currentUser: User) -> Bool {
        for user in arrayUsers {
            if userLogin.lowercased() == currentUser.email.lowercased() {
                return true
            }
            return false
        }
        return false
    }
}
