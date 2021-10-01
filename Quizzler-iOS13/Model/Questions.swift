//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Veekay Infotech on 11/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Questions {
    let text : String
    let answer : String
    
    init(q : String, a : String) {
        text = q
        answer = a
    }
}
