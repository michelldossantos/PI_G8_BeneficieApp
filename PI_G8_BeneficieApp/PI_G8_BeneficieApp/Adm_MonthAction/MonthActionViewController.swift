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
    
    @IBOutlet weak var FinancesContainer: UIView!
    @IBOutlet weak var ParticipantsContainer: UIView!
    @IBOutlet weak var ConfigureActionsContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureUI()
        
    }
    
    @IBAction func BackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func profileButton(_ sender: Any) {
        if let Profile = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as? ProfileViewController {
            navigationController?.pushViewController(Profile, animated: true)
        }
    }
    @IBAction func bankInformations(_ sender: Any) {
        if let bankInformations = UIStoryboard(name: "BankInformations", bundle: nil).instantiateInitialViewController() as? BankInformationsViewController {
            navigationController?.pushViewController(bankInformations, animated: true)
        }

    }
    @IBAction func EditAction(_ sender: UIButton) {
    }
    @IBAction func ListAction(_ sender: UIButton) {
        if let actions = UIStoryboard(name: "AdmActions", bundle: nil).instantiateInitialViewController() as? AdmActionsViewController {
            navigationController?.pushViewController(actions, animated: true)
        }
    }
    @IBAction func CreateAction(_ sender: UIButton) {
        if let actions = UIStoryboard(name: "CreateAction", bundle: nil).instantiateInitialViewController() as? CreateActionViewController {
            navigationController?.pushViewController(actions, animated: true)
        }
    }
    @IBAction func ParticipantsButton(_ sender: UIButton) {
        
        if let ParticipantsView = UIStoryboard(name: "ParticipantsList", bundle: nil).instantiateInitialViewController() as? ParticipantsViewController {
            navigationController?.pushViewController(ParticipantsView, animated: true)
        }
    }
    func configureUI(){
        purpleView.RoundView()
        pinkView.RoundView()
        whiteView.RoundView()
        
        FinancesContainer.setupShadow(opacity: 0.2, radius: 4)
        ParticipantsContainer.setupShadow(opacity: 0.2, radius: 4)
        ConfigureActionsContainer.setupShadow(opacity: 0.2, radius: 4)
    }
    
	
}
