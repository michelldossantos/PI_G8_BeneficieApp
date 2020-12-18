//
//  CreateActionViewController.swift
//  PI_G8_BeneficieApp
//
//  Created by Juan Souza on 22/11/20.
//  Copyright © 2020 Juan Souza. All rights reserved.
//

import UIKit

class EditActionViewController: UIViewController {

    var viewModel = EditActionViewModel()
    
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet var tableViewEvents: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableViewEvents.delegate = self
        tableViewEvents.dataSource = self
        
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        //ActionContainer.setupShadow(opacity: 0.2, radius: 4)
        saveButtonOutlet.layer.cornerRadius = 15
    }
    @IBAction func profileButton(_ sender: Any) {
        if let Profile = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as? ProfileViewController {
            navigationController?.pushViewController(Profile, animated: true)
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Ação Salva", message: "Ação salva com sucesso", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func bankInformationsScreen() {
        if let banks = UIStoryboard(name: "BankInformations", bundle: nil).instantiateInitialViewController() as? BankInformationsViewController {
            navigationController?.pushViewController(banks, animated: true)
        }
    }
    
    func participantsListScreen() {
        if let list = UIStoryboard(name: "ParticipantsList", bundle: nil).instantiateInitialViewController() as? ParticipantsViewController {
            navigationController?.pushViewController(list, animated: true)
        }
    }
}

extension EditActionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.arrayEvents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Evento", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Editar Ação", style: .default, handler: {_ in
            
        }))
        alert.addAction(UIAlertAction(title: "Informações Bancárias", style: .default, handler: {_ in
            self.bankInformationsScreen()
        }))
        alert.addAction(UIAlertAction(title: "Participantes Cadastrados", style: .default, handler: {_ in
            self.participantsListScreen()
        }))
        alert.addAction(UIAlertAction(title: "Excluir", style: .destructive, handler: {_ in
            self.viewModel.arrayEvents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {_ in
        }))
        present(alert, animated: true)
    }
}

extension EditActionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = viewModel.arrayEvents[indexPath.row]
        return cell
    }
    
    
}
