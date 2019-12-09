//
//  NetworkManager.swift
//  CharacterCreator
//
//  Created by Ethan Siapno on 12/7/19.
//  Copyright © 2019 Ethan CS 1998. All rights reserved.
//

import Foundation
import Alamofire

//http://35.229.74.106/characters/
//http://35.229.74.106/character/

class NetworkManager {
    private static let endpoint = "http://35.229.74.106/characters/"
    private static let postEndpoint = "http://35.229.74.106/character/"
    private static let postHelp = "http://35.229.74.106/character/recent/"
    private static let deleteEndpoint = "http://35.229.74.106/character/"
    
    static func getCharacters(completion: @escaping ([Character]) -> Void) {
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let charactersData = try? jsonDecoder.decode(CharacterResponse.self, from: data) {
                    let characters = charactersData.data
                    completion(characters)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postCharacter(character: Character) {
        let param: [String: Any] = [
            "backHairImageName": character.backHairImageName,
            "frontHairImageName": character.frontHairImageName,
            "eyeImageName": character.eyeImageName,
            "eyebrowImageName": character.eyebrowImageName,
            "mouthImageName": character.mouthImageName,
            "skinColorImageName": character.skinColorImageName,
            "outfitImageName": character.outfitImageName,
            "shoeImageName": character.shoeImageName,
            "earImageName": character.earImageName
        ]
        Alamofire.request(postEndpoint, method: .post, parameters: param, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(_):
//                Alamofire.request(postHelp, method: .get).validate().responseData { response2 in
//                    switch response2.result {
//                    case .success(let data):
//                        //print("hellO?")
//                        let jsonDecoder = JSONDecoder()
//                        if let charData = try? jsonDecoder.decode(Character.self, from: data) {
//                            print("hmmm")
//
//                            character.setID(ID: charData.id)
//                            print(charData.id)
//                        }
//                        print("success2")
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
                print("SUCCESS!!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteCharacter(character: Character, ID: Int) {
        Alamofire.request(deleteEndpoint + "\(ID)/", method: .delete).validate().responseData { response in
            switch response.result {
            case .success(_):
                print("Character deleted!")
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
