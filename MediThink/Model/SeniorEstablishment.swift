//
//  SeniorEstablishment.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 02/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


import Foundation


struct SeniorEstablishment {
    let name: String
    let zip: String
    let phone: String
    let town: String
}

// MARK: - SeniorEstablishmentFromJSON
struct SeniorEstablishmentFromJSON: Codable {
    let type: String
    let features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let type: String
    let geometry: Geometry
    let properties: Properties
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Properties
struct Properties: Codable {
    let id, codeInsee, pivotLocal, nom: String
    let adresses: [Adress]
    let horaires: [Horaire]?
    let email, telephone: String
    let zonage: Zonage
    let url: String?
}

// MARK: - Adress
struct Adress: Codable {
    let type: String
    let lignes: [String]
    let codePostal, commune: String
    let coordonnees: [Double]
}

// MARK: - Horaire
struct Horaire: Codable {
    let du, au: String
    let heures: [Heure]
}

// MARK: - Heure
struct Heure: Codable {
    let de, a: String
}

// MARK: - Zonage
struct Zonage: Codable {
    let communes: [String]
}
