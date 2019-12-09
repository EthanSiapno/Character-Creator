//
//  CharacterCollectionViewCell.swift
//  CharacterCreator
//
//  Created by Ethan Siapno on 11/21/19.
//  Copyright © 2019 Ethan CS 1998. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    var body: UIImageView!
    var eyes: UIImageView!
    var frontHair: UIImageView!
    var backHair: UIImageView!
    var eyebrows: UIImageView!
    var mouth: UIImageView!
    var outfit: UIImageView!
    var shoes: UIImageView!
    var ear: UIImageView!
    var closeButton: UIButton!
    
    var char: Character?
    var delegate: DeleteCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        body = UIImageView()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.contentMode = .scaleAspectFill
        body.layer.masksToBounds = true
        contentView.addSubview(body)
        
        ear = UIImageView()
        ear.translatesAutoresizingMaskIntoConstraints = false
        ear.contentMode = .scaleAspectFill
        ear.layer.masksToBounds = true
        contentView.addSubview(ear)
        
        eyes = UIImageView()
        eyes.translatesAutoresizingMaskIntoConstraints = false
        eyes.contentMode = .scaleAspectFill
        eyes.layer.masksToBounds = true
        contentView.addSubview(eyes)
        
        shoes = UIImageView()
        shoes.translatesAutoresizingMaskIntoConstraints = false
        shoes.contentMode = .scaleAspectFill
        shoes.layer.masksToBounds = true
        contentView.addSubview(shoes)
        
        backHair = UIImageView()
        backHair.translatesAutoresizingMaskIntoConstraints = false
        backHair.contentMode = .scaleAspectFill
        backHair.layer.masksToBounds = true
        contentView.addSubview(backHair)
        
        mouth = UIImageView()
        mouth.translatesAutoresizingMaskIntoConstraints = false
        mouth.contentMode = .scaleAspectFill
        mouth.layer.masksToBounds = true
        contentView.addSubview(mouth)
        
        eyebrows = UIImageView()
        eyebrows.translatesAutoresizingMaskIntoConstraints = false
        eyebrows.contentMode = .scaleAspectFill
        eyebrows.layer.masksToBounds = true
        contentView.addSubview(eyebrows)
        
        outfit = UIImageView()
        outfit.translatesAutoresizingMaskIntoConstraints = false
        outfit.contentMode = .scaleAspectFill
        outfit.layer.masksToBounds = true
        contentView.addSubview(outfit)
        
        frontHair = UIImageView()
        frontHair.translatesAutoresizingMaskIntoConstraints = false
        frontHair.contentMode = .scaleAspectFill
        frontHair.layer.masksToBounds = true
        contentView.addSubview(frontHair)
        
        closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "x")
        closeButton.setImage(buttonImage, for: .normal)
        closeButton.contentMode = .scaleAspectFill
        closeButton.layer.masksToBounds = true
        closeButton.addTarget(self, action: #selector(deleteChar), for: .touchUpInside)
        contentView.addSubview(closeButton)
        
        /* ORDER:
         body
         ear
         eyes
         shoes
         backhair
         mouth
         eyebrows
         outfit
         fronthair
         */
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            body.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            ear.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            ear.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ear.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ear.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            eyes.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            eyes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eyes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eyes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            shoes.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            shoes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shoes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shoes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            backHair.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            backHair.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backHair.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backHair.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            mouth.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mouth.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mouth.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mouth.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            eyebrows.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            eyebrows.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eyebrows.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eyebrows.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            outfit.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            outfit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outfit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outfit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            frontHair.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            frontHair.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frontHair.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frontHair.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            closeButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            closeButton.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
        ])
    }
    
    func configure(for character: Character) {
        body.image = UIImage(named: character.skinColorImageName)
        ear.image = UIImage(named: character.earImageName)
        eyes.image = UIImage(named: character.eyeImageName)
        shoes.image = UIImage(named: character.shoeImageName)
        backHair.image = UIImage(named: character.backHairImageName)
        mouth.image = UIImage(named: character.mouthImageName)
        eyebrows.image = UIImage(named: character.eyeImageName)
        outfit.image = UIImage(named: character.outfitImageName)
        frontHair.image = UIImage(named: character.frontHairImageName)
        char = character
    }
    
    @objc func deleteChar() {
        delegate?.deleteCell(to: self)
        print("help")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
