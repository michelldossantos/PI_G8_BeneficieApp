//
//  ProfileViewController.swift
//  PI_G8_BeneficieApp
//
//  Created by Dominique Nascimento Bezerra on 21/11/20.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var labelUserName: UILabel!
    var currentUser = User()
    
    static func getView() -> ProfileViewController {
        let profile = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! ProfileViewController
        return profile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelUserName.text = currentUser.nome
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                let alert = UIAlertController(title: "Sair", message: "Você foi deslogade", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                    
                    let storyboard = UIStoryboard(name: "MainScreen", bundle: nil)
                    UIViewController.replaceRootViewController(viewController: storyboard.instantiateInitialViewController()!)
                }))
                present(alert, animated: true)
                

            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
                let alert = UIAlertController(title: "Não foi possível sair", message: "Tente Novamente", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
//                    let storyboard = UIStoryboard(name: "MainScreen", bundle: nil)
//                    UIViewController.replaceRootViewController(viewController: storyboard.instantiateInitialViewController()!)
                }))
                present(alert, animated: true)
    }
      
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func buttonEmail(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func configurationButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func contactButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.signOut()
    }
}