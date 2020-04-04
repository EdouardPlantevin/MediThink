//
//  SeniorEstablishmentService.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 02/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


class SeniorEstablishmentService {
    
    var arrayOfSeniorEstablishment: [SeniorEstablishment] = []
    
    private var task: URLSessionDataTask?
    private var session = URLSession(configuration: .default)
    
    init(session: URLSession) {
        self.session = session
    }
    
    private let seniorBase = URL(string: "https://etablissements-publics.api.gouv.fr/v3/departements/")!
    private let seniorEnd = URL(string: "/accompagnement_personnes_agees")!
    
     func getSeniorEstablishment(city: String, callBack: @escaping (Bool) -> Void) {
        
        let seniorUrl = URL(string: "\(seniorBase)\(city)\(seniorEnd)")!
            
        task?.cancel()

        task = session.dataTask(with: seniorUrl) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    callBack(false)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callBack(false)
                    return
                }
                // JSON decodable
                guard let senior = try? JSONDecoder().decode(SeniorEstablishmentFromJSON.self, from: data) else {
                    callBack(false)
                    return
                }
                self.arrayOfSeniorEstablishment.removeAll()
                for establishment in senior.features {
                    let name = establishment.properties.adresses.first?.lignes.first ?? "No name found"

                    let zip = establishment.properties.adresses.first?.codePostal ?? "No zip found"
                    let town = establishment.properties.adresses.first?.commune ?? "No town found"
                    let phone = establishment.properties.telephone
                    let newEstablishment = SeniorEstablishment(name: name, zip: zip, phone: phone, town: town)
                    self.arrayOfSeniorEstablishment.append(newEstablishment)
                }
                callBack(true)
            }
        }
        task?.resume()
    }
    
    
}
