//
//  MonthActionViewController.swift
//  PI_G8_BeneficieApp
//
//  Created by Juan Souza on 21/11/20.
//  Copyright © 2020 Juan Souza. All rights reserved.
//

import UIKit

class MonthActionViewController: UIViewController {

    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var financesContainer: UIView!
    @IBOutlet weak var participantsContainer: UIView!
    @IBOutlet weak var configureActionsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureUI()
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func profileButton(_ sender: Any) {
        let profileScreen = ProfileViewController.getView()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @IBAction func bankInformations(_ sender: Any) {
        if let bankInformations = UIStoryboard(name: "BankInformations", bundle: nil).instantiateInitialViewController() as? BankInformationsViewController {
            navigationController?.pushViewController(bankInformations, animated: true)
        }

    }
    
    @IBAction func editAction(_ sender: UIButton) {
    }
    @IBAction func ListAction(_ sender: UIButton) {
        if let actions = UIStoryboard(name: "AdmActions", bundle: nil).instantiateInitialViewController() as? AdmActionsViewController {
            navigationController?.pushViewController(actions, animated: true)
        }
    }
    @IBAction func createAction(_ sender: UIButton) {
        if let actions = UIStoryboard(name: "CreateAction", bundle: nil).instantiateInitialViewController() as? CreateActionViewController {
            navigationController?.pushViewController(actions, animated: true)
        }
    }
    @IBAction func participantsButton(_ sender: UIButton) {
        
        if let participantsView = UIStoryboard(name: "ParticipantsList", bundle: nil).instantiateInitialViewController() as? ParticipantsViewController {
            navigationController?.pushViewController(participantsView, animated: true)
        }
    }
    func configureUI(){
        purpleView.RoundView()
        pinkView.RoundView()
        whiteView.RoundView()
        
        financesContainer.setupShadow(opacity: 0.2, radius: 4)
        participantsContainer.setupShadow(opacity: 0.2, radius: 4)
        configureActionsContainer.setupShadow(opacity: 0.2, radius: 4)
    }
    
	
}