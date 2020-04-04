//
//  FakeResponseData.swift
//  BaluchonTests
//
//  Created by Edouard PLANTEVIN on 07/02/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class FakeResponseData {
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassroom.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassroom.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class GetError: Error {}
    static let error = GetError()
    
    
    static var seniorCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        guard let url = bundle.url(forResource: "senior", withExtension: "json") else {
            fatalError("senior.json is not found.")
        }
        return try? Data(contentsOf: url)
    }
    
    static let seniorIncorrectData = "erreur".data(using: .utf8)!
}
