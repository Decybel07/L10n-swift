//
//  AccentedTextDecorator.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 05/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

struct AccentedTextDecorator: TextDecorator {
    
    private static let up = "\u{0300}\u{0301}\u{0302}\u{0303}\u{0304}\u{0306}\u{0307}\u{0308}\u{030A}\u{030B}\u{030C}\u{030D}\u{030E}\u{030F}\u{0310}\u{0311}\u{0312}\u{0313}\u{0314}\u{0342}\u{0343}\u{034A}"
    private static let down = "\u{0316}\u{0317}\u{031c}\u{0324}\u{0325}\u{0326}\u{0329}\u{032b}\u{032c}\u{032d}\u{032e}\u{032f}\u{0330}\u{0331}"
    
    func decorate(text: String) -> String {
        return text.map(self.decorate(char:)).joined()
    }
    
    private func decorate(char: Character) -> String {
        let base = String(char)
        guard char.isLetter else {
            return base
        }
        let hash = Int(char.unicodeScalars.first?.value ?? 0)
        return base
            + self.scalar(AccentedTextDecorator.up.unicodeScalars, for: hash)
            + self.scalar(AccentedTextDecorator.down.unicodeScalars, for: hash)
    }
    
    private func scalar(_ unicodeScalars: String.UnicodeScalarView, for hash: Int) -> String {
        return String(unicodeScalars[unicodeScalars.index(unicodeScalars.startIndex, offsetBy: hash % unicodeScalars.count)])
    }
}
