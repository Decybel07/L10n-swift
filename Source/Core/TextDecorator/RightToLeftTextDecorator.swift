//
//  RightToLeftTextDecorator.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 05/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

struct RightToLeftTextDecorator: TextDecorator {
    
    func decorate(text: String) -> String {
        return String(text.reversed())
    }
}
