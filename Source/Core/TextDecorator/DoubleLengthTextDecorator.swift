//
//  DoubleLengthTextDecorator.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 05/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

struct DoubleLengthTextDecorator: TextDecorator {
    
    func decorate(text: String) -> String {
        return "\(text) \(text)"
    }
}
