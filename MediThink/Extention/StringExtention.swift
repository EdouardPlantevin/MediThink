//
//  StringExtention.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 01/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation



extension StringProtocol { // for Swift 4 you need to add the constrain `where Index == String.Index`
    var byWords: [SubSequence] {
        var byWords: [SubSequence] = []
        enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
            byWords.append(self[range])
        }
        return byWords
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    var isInt: Bool {
        return Int(self) != nil
    }
}
