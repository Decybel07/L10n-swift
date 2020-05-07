//
//  BoundedTextDecorator.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 06/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

struct BoundedTextDecorator: TextDecorator {
    
    func decorate(text: String) -> String {
        return "[# \(text) #]"
    }
}
