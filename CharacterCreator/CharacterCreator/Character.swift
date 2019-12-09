//
//  Character.swift
//  CharacterCreator
//
//  Created by Ethan Siapno on 11/19/19.
//  Copyright © 2019 Ethan CS 1998. All rights reserved.
//

import Foundation

struct CharacterResponse: Codable {
    var data: [Character]
}

class Character: Codable, Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var backHairImageName: String
    var frontHairImageName: String
    var eyeImageName: String
    var eyebrowImageName: String
    var mouthImageName: String
    var skinColorImageName: String
    var outfitImageName: String
    var shoeImageName: String
    var earImageName: String
    
    init(ID: Int, backHair: String, frontHair: String, eye: String, eyebrow: String, mouth: String, skinColor: String, outfit: String, shoe: String, ear: String) {
        id = ID
        backHairImageName = backHair
        frontHairImageName = frontHair
        eyeImageName = eye
        eyebrowImageName = eyebrow
        mouthImageName = mouth
        skinColorImageName = skinColor
        outfitImageName = outfit
        shoeImageName = shoe
        earImageName = ear
    }
    
    func setID(ID: Int) {
        id = ID
    }
}
