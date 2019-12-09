//
//  CreateViewController.swift
//  CharacterCreator
//
//  Created by Ethan Siapno on 11/19/19.
//  Copyright © 2019 Ethan CS 1998. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    var arrowLeftButton: UIButton!
    var arrowRightButton: UIButton!
    var body: UIImageView!
    var shoes: UIImageView!
    var eyes: UIImageView!
    var frontHair: UIImageView!
    var backHair: UIImageView!
    var eyebrows: UIImageView!
    var mouth: UIImageView!
    var outfit: UIImageView!
    var ear: UIImageView!
    
    var assetLeftArrow: UIButton!
    var assetRightArrow: UIButton!
    var assetLabel: UILabel!
    var assetTypeArray: [String] = ["Skin Color", "Eyes", "Hair", "Mouth", "Eyebrows", "Outfit", "Shoes", "Ear"]
    var assetCounter: Int = 0
    
    var delegate: CharacterToCellDelegate?
    
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    var skinCounter: Int = 0
    var skinImageArray: [String] = ["body_skin_1", "body_skin_2", "body_skin_3"]
    var eyeCounter: Int = 0
    var eyeImageArray: [String] = ["eyes_1", "eye_1_color_2", "eye_1_color_3", "eyes_2", "eye_2_color_2", "eye_2_color_3", "eyes_3_color_1", "eye_3_color_2", "eye_3_color_3", "eyes_4_color_1", "eye_4_color_2", "eye_4_color_3", "blank"]
    var hairCounter: Int = 0
    var frontHairImageArray: [String] = ["hair_1_color_1", "hair_1_color_2", "hair_1_color_3", "hair_1_color_4", "hair_1_color_5", "hair_2_color_2", "hair_2_color_3", "blank"]
    var backHairImageArray: [String] = ["hair_1_color_1_behind", "hair_1_color_2_behind", "hair_1_color_3_behind", "hair_1_color_4_behind", "hair_1_color_5_behindd", "blank", "blank", "blank"]
    var eyebrowCounter: Int = 0
    var eyebrowImageArray: [String] = ["eyebrows_1", "eyebrows_2", "blank"]
    var mouthCounter: Int = 0
    var mouthImageArray: [String] = ["mouth_1", "mouth_2", "blank"]
    var outfitCounter: Int = 0
    var outfitImageArray: [String] = ["outfit_1", "outfit_1_color_2", "outfit_1_color_3", "outfit_1_color_4", "outfit_1_color_5", "outfit_2", "outfit_2_color_2", "outfit_2_color_3", "outfit_2_color_4", "outfit_3", "outfit_3_color_2", "outfit_3_color_3", "outfit_3_color_4", "outfit_3_color_5", "blank"]
    var shoeCounter: Int = 0
    var shoeImageArray: [String] = ["shoes_1", "shoes_1_color_2", "shoes_1_color_3", "shoes_1_color_4", "shoes_1_color_5", "shoes_2", "shoes_2_color_2", "shoes_2_color_3", "shoes_3", "shoes_3_color_2", "shoes_3_color_3", "blank"]
    var earCounter: Int = 0
    var earImageArray: [String] = ["ear_1", "blank"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "New Character"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPress))
        
        body = UIImageView()
        body.image = UIImage(named: "body_skin_1")
        body.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(body)
        
        ear = UIImageView()
        ear.image = UIImage(named: "ear_1")
        ear.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ear)
        
        eyes = UIImageView()
        eyes.image = UIImage(named: "eyes_1")
        eyes.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eyes)
        
        shoes = UIImageView()
        shoes.image = UIImage(named: "shoes_1")
        shoes.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shoes)
        
        backHair = UIImageView()
        backHair.image = UIImage(named: "hair_1_color_1_behind")
        backHair.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backHair)
        
        mouth = UIImageView()
        mouth.image = UIImage(named: "mouth_1")
        mouth.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mouth)
        
        eyebrows = UIImageView()
        eyebrows.image = UIImage(named: "eyebrows_1")
        eyebrows.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eyebrows)
        
        outfit = UIImageView()
        outfit.image = UIImage(named: "outfit_1")
        outfit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(outfit)
        
        frontHair = UIImageView()
        frontHair.image = UIImage(named: "hair_1_color_1")
        frontHair.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(frontHair)
        
        arrowLeftButton = UIButton()
        arrowLeftButton.translatesAutoresizingMaskIntoConstraints = false
        arrowLeftButton.setImage(UIImage(named: "arrow"), for: .normal)
        arrowLeftButton.addTarget(self, action: #selector(arrowLeftButtonController), for: .touchUpInside)
        view.addSubview(arrowLeftButton)
        
        let rightArrow = UIImage(named: "arrow")
        arrowRightButton = UIButton()
        arrowRightButton.translatesAutoresizingMaskIntoConstraints = false
        arrowRightButton.setImage(rightArrow?.withHorizontallyFlippedOrientation(), for: .normal)
        arrowRightButton.addTarget(self, action: #selector(arrowRightButtonController), for: .touchUpInside)
        view.addSubview(arrowRightButton)
        
        assetLeftArrow = UIButton()
        assetLeftArrow.translatesAutoresizingMaskIntoConstraints = false
        assetLeftArrow.setImage(UIImage(named: "arrow"), for: .normal)
        assetLeftArrow.addTarget(self, action: #selector(assetLeftArrowController), for: .touchUpInside)
        view.addSubview(assetLeftArrow)
        
        assetRightArrow = UIButton()
        assetRightArrow.translatesAutoresizingMaskIntoConstraints = false
        assetRightArrow.setImage(rightArrow?.withHorizontallyFlippedOrientation(), for: .normal)
        assetRightArrow.addTarget(self, action: #selector(assetRightArrowController), for: .touchUpInside)
        view.addSubview(assetRightArrow)
        
        assetLabel = UILabel()
        assetLabel.text = assetTypeArray[assetCounter]
        assetLabel.textColor = .black
        assetLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        assetLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(assetLabel)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            body.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            body.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            body.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            ear.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            ear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            ear.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            ear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            eyes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            eyes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            eyes.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            eyes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            shoes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            shoes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            shoes.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            shoes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            backHair.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            backHair.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            backHair.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            backHair.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            mouth.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            mouth.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            mouth.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            mouth.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            eyebrows.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            eyebrows.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            eyebrows.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            eyebrows.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            outfit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            outfit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            outfit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            outfit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            frontHair.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            frontHair.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            frontHair.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -headerHeight*2),
            frontHair.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ])
        NSLayoutConstraint.activate([
            arrowLeftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
            arrowLeftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowLeftButton.heightAnchor.constraint(equalToConstant:50),
            arrowLeftButton.widthAnchor.constraint(equalToConstant:50)
        ])
        NSLayoutConstraint.activate([
            arrowRightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150),
            arrowRightButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowRightButton.heightAnchor.constraint(equalToConstant:50),
            arrowRightButton.widthAnchor.constraint(equalToConstant:50)
        ])
        NSLayoutConstraint.activate([
            assetLeftArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -120),
            assetLeftArrow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            assetLeftArrow.heightAnchor.constraint(equalToConstant:30),
            assetLeftArrow.widthAnchor.constraint(equalToConstant:30)
        ])
        NSLayoutConstraint.activate([
            assetRightArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120),
            assetRightArrow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight),
            assetRightArrow.heightAnchor.constraint(equalToConstant:30),
            assetRightArrow.widthAnchor.constraint(equalToConstant:30)
        ])
        NSLayoutConstraint.activate([
            assetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            assetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: headerHeight + 5)
            //assetLabel.heightAnchor.constraint(equalToConstant:30),
            //assetLabel.widthAnchor.constraint(equalToConstant:30)
        ])
    }
    
    @objc func arrowLeftButtonController() {
        if assetCounter % 8 == 0 {
            skinButton(direction: "Left")
        }
        if assetCounter % 8 == 1 {
            eyeButton(direction: "Left")
        }
        if assetCounter % 8 == 2 {
            hairButton(direction: "Left")
        }
        if assetCounter % 8 == 3 {
            mouthButton(direction: "Left")
        }
        if assetCounter % 8 == 4 {
            eyebrowButton(direction: "Left")
        }
        if assetCounter % 8 == 5 {
            outfitButton(direction: "Left")
        }
        if assetCounter % 8 == 6 {
            shoeButton(direction: "Left")
        }
        if assetCounter % 8 == 7 {
            earButton(direction: "Left")
        }
    }
    
    @objc func arrowRightButtonController() {
        if assetCounter % 8 == 0 {
            skinButton(direction: "Right")
        }
        if assetCounter % 8 == 1 {
            eyeButton(direction: "Right")
        }
        if assetCounter % 8 == 2 {
            hairButton(direction: "Right")
        }
        if assetCounter % 8 == 3 {
            mouthButton(direction: "Right")
        }
        if assetCounter % 8 == 4 {
            eyebrowButton(direction: "Right")
        }
        if assetCounter % 8 == 5 {
            outfitButton(direction: "Right")
        }
        if assetCounter % 8 == 6 {
            shoeButton(direction: "Right")
        }
        if assetCounter % 8 == 7 {
            earButton(direction: "Right")
        }
    }

    @objc func saveButtonPress() {
        let newCharacter = Character(ID: 0, backHair: backHairImageArray[hairCounter % 8], frontHair: frontHairImageArray[hairCounter % 8], eye: eyeImageArray[eyeCounter % 13], eyebrow: eyebrowImageArray[eyebrowCounter % 3], mouth: mouthImageArray[mouthCounter % 3], skinColor: skinImageArray[skinCounter % 3], outfit: outfitImageArray[outfitCounter % 15], shoe: shoeImageArray[shoeCounter % 6], ear: earImageArray[earCounter % 2])
        //let newCharacter = Character(id: 0, backHairImageName: backHairImageArray[hairCounter % 8], frontHairImageName: frontHairImageArray[hairCounter % 8], eyeImageName: eyeImageArray[eyeCounter % 13], eyebrowImageName: eyebrowImageArray[eyebrowCounter % 3], mouthImageName: mouthImageArray[mouthCounter % 3], skinColorImageName: skinImageArray[skinCounter % 3], outfitImageName: outfitImageArray[outfitCounter % 15], shoeImageName: shoeImageArray[shoeCounter % 12], earImageName: earImageArray[earCounter % 2])
        delegate?.saveNewCharacter(to: newCharacter)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func assetLeftArrowController() {
        assetCounter = assetCounter - 1
        if assetCounter < 0 {
            assetCounter = assetCounter + 8
        }
        assetLabel.text = assetTypeArray[assetCounter % 8]
    }
    
    @objc func assetRightArrowController() {
        assetCounter = assetCounter + 1
        assetLabel.text = assetTypeArray[assetCounter % 8]
    }
    
    func skinButton(direction: String) {
        if direction == "Left" {
            skinCounter = skinCounter - 1
            if skinCounter < 0 {
                skinCounter = skinCounter + 3
            }
            body.image = UIImage(named: skinImageArray[skinCounter % 3])
        }
        if direction == "Right" {
            skinCounter = skinCounter + 1
            body.image = UIImage(named: skinImageArray[skinCounter % 3])
        }
    }
    
    func eyeButton(direction: String) {
        if direction == "Left" {
            eyeCounter = eyeCounter - 1
            if eyeCounter < 0 {
                eyeCounter = eyeCounter + 13
            }
            eyes.image = UIImage(named: eyeImageArray[eyeCounter % 13])
        }
        if direction == "Right" {
            eyeCounter = eyeCounter + 1
            eyes.image = UIImage(named: eyeImageArray[eyeCounter % 13])
        }
    }
    
    func hairButton(direction: String) {
        if direction == "Left" {
            hairCounter = hairCounter - 1
            if hairCounter < 0 {
                hairCounter = hairCounter + 8
            }
            frontHair.image = UIImage(named: frontHairImageArray[hairCounter % 8])
            backHair.image = UIImage(named: backHairImageArray[hairCounter % 8])
        }
        if direction == "Right" {
            hairCounter = hairCounter + 1
            frontHair.image = UIImage(named: frontHairImageArray[hairCounter % 8])
            backHair.image = UIImage(named: backHairImageArray[hairCounter % 8])
        }
    }
    
    func mouthButton(direction: String) {
        if direction == "Left" {
            mouthCounter = mouthCounter - 1
            if mouthCounter < 0 {
                mouthCounter = mouthCounter + 3
            }
            mouth.image = UIImage(named: mouthImageArray[mouthCounter % 3])
        }
        if direction == "Right" {
            mouthCounter = mouthCounter + 1
            mouth.image = UIImage(named: mouthImageArray[mouthCounter % 3])
        }
    }
    
    func eyebrowButton(direction: String) {
        if direction == "Left" {
            eyebrowCounter = eyebrowCounter - 1
            if eyebrowCounter < 0 {
                eyebrowCounter = eyebrowCounter + 3
            }
            eyebrows.image = UIImage(named: eyebrowImageArray[eyebrowCounter % 3])
        }
        if direction == "Right" {
            eyebrowCounter = eyebrowCounter + 1
            eyebrows.image = UIImage(named: eyebrowImageArray[eyebrowCounter % 3])
        }
    }
    
    func outfitButton(direction: String) {
        if direction == "Left" {
            outfitCounter = outfitCounter - 1
            if outfitCounter < 0 {
                outfitCounter = outfitCounter + 15
            }
            outfit.image = UIImage(named: outfitImageArray[outfitCounter % 15])
        }
        if direction == "Right" {
            outfitCounter = outfitCounter + 1
            outfit.image = UIImage(named: outfitImageArray[outfitCounter % 15])
        }
    }
    
    func shoeButton(direction: String) {
        if direction == "Left" {
            shoeCounter = shoeCounter - 1
            if shoeCounter < 0 {
                shoeCounter = shoeCounter + 12
            }
            shoes.image = UIImage(named: shoeImageArray[shoeCounter % 12])
        }
        if direction == "Right" {
            shoeCounter = shoeCounter + 1
            shoes.image = UIImage(named: shoeImageArray[shoeCounter % 12])
        }
    }
    
    func earButton(direction: String) {
        if direction == "Left" {
            earCounter = earCounter - 1
            if earCounter < 0 {
                earCounter = earCounter + 2
            }
            ear.image = UIImage(named: earImageArray[earCounter % 2])
        }
        if direction == "Right" {
            earCounter = earCounter + 1
            ear.image = UIImage(named: earImageArray[earCounter % 2])
        }
    }
}
