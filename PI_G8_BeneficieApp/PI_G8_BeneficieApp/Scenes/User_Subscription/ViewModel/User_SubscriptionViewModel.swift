//
//  User_SubscriptionViewModel.swift
//  PI_G8_BeneficieApp
//
//  Created by Dominique Nascimento Bezerra on 07/12/20.
//  Copyright © 2020 Juan Souza. All rights reserved.
//

import Foundation

class User_SubscriptionViewModel {
    
    var arrayEvents = [Event]()
    var arraySubGroups = [String]()
    
    var apiManager = EventList_APIManager()
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
        apiManager.request(url: "https://beneficie-app.herokuapp.com/beneficie/actions/") { (json, jsonArray, string) in
                if let jsonArray = jsonArray {
                    var events = [Event]()
                    var groups = [String]()
                    for item in jsonArray {
                        events.append(Event(fromDictionary: item))
                    }
                    for event in events {
                        groups.append(String(event.grupos))
                    }
                    self.arrayEvents = events
                    self.arraySubGroups = groups
                    onComplete(true)
                    return
                }
                onComplete(false)
            }
        }
    
}
