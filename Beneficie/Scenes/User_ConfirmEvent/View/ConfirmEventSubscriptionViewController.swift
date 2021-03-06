//
//  ConfirmEventSubscriptionViewController.swift
//  PI_G8_BeneficieApp
//
//  Created by Dominique Nascimento Bezerra on 23/11/20.
//

import UIKit

class ConfirmEventSubscriptionViewController: UIViewController {

    @IBOutlet var subgroupLabel: UILabel!
    @IBOutlet var eventTitleLabel: UILabel!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var confirmButton: UIButton!
    
    var viewModel = ConfirmEventSubscriptionViewModel()
    var currentEvent = Event()
    var currentUser = User()
    var userToken = ""
    var currentSubgroup = Subgroup()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.setupValues(currentEvent, currentUser, currentSubgroup)
        
        setUpUI()
        
    }
    
    func setUpUI() {
        fullNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        eventTitleLabel.text = self.viewModel.currentEvent.titulo
        subgroupLabel.text = "Subgrupo \(viewModel.currentSubgroup.grupo)"
        confirmButton.layer.cornerRadius = 15
        fullNameTextField.text = viewModel.currentUser.name
        phoneNumberTextField.text = viewModel.currentUser.phoneNumber
    }
    
    func showAlert(title: String, message: String, okHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: okHandler))
        present(alert, animated: true, completion: nil)
    }
    

    
    func subscribeUser() {
        viewModel.checkUser(name: self.fullNameTextField.text!, phoneNumber: self.phoneNumberTextField.text!)
        if let index = viewModel.currentEvent.subgrupos.firstIndex(where: { $0.grupo == viewModel.currentSubgroup.grupo }) {
            viewModel.currentEvent.subgrupos[index].inscritos.append(viewModel.currentUser.uid)
            viewModel.currentEvent.subgrupos[index].vagasDisponiveisSubgrupo -= 1
            viewModel.subscribeUser(userToken: userToken, event: viewModel.currentEvent, subgroup: viewModel.currentSubgroup, onComplete: { (success) in
                if success {
                    self.showAlert(title: "Inscrição Confirmada", message: "Você foi inscrito na ação", okHandler: {_ in
                        self.viewModel.saveNewEventToDataBase(eventName: self.viewModel.currentEvent.titulo,
                                                              eventDate: self.viewModel.currentEvent.data,
                                                              eventAddress: self.viewModel.currentEvent.local,
                                                              eventDescription: self.viewModel.currentEvent.descricao,
                                                              eventSubgroup: self.viewModel.currentSubgroup.grupo)
                        self.viewModel.newRootController()
                    })
                } else {
                    self.showAlert(title: "Erro", message: "Não foi possível realizar inscrição", okHandler: {_ in
                       self.viewModel.newRootController()
                    })
                }
            })
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func profileButton(_ sender: Any) {
        self.viewModel.goToProfileScreen(user: viewModel.currentUser ,navigationController: self.navigationController)
    }
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        self.subscribeUser()
    }
    

}

extension ConfirmEventSubscriptionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        } else if textField == fullNameTextField {
            fullNameTextField.resignFirstResponder()
            phoneNumberTextField.becomeFirstResponder()
            return true
        }else if textField == phoneNumberTextField {
            phoneNumberTextField.resignFirstResponder()
            self.subscribeUser()
            return true
        }else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == nil {
            self.showAlert(title: "Preencha os campos", message: "", okHandler: nil)
        }
    }
}
