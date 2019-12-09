//
//  ViewController.swift
//  CharacterCreator
//
//  Created by Ethan Siapno on 11/19/19.
//  Copyright © 2019 Ethan CS 1998. All rights reserved.
//

import UIKit

protocol CharacterToCellDelegate: class {
    func saveNewCharacter(to character: Character)
}

protocol DeleteCellDelegate: class {
    func deleteCell(to cell: CharacterCollectionViewCell)
}

class ViewController: UIViewController {

    var createCharButton: UIButton!
    var collectionView: UICollectionView!
    var timer: Timer!
    
    var characters = [Character]()
    let characterCellReuseIdentifier = "characterCellReuseIdentifier"
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Create a Character to Add CollectionViewCells"
        
        createCharButton = UIButton()
        createCharButton.translatesAutoresizingMaskIntoConstraints = false
        createCharButton.setTitle("Create", for: .normal)
        createCharButton.setTitleColor(.black, for: .normal)
        createCharButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        createCharButton.backgroundColor = .systemBlue
        createCharButton.addTarget(self, action: #selector(createViewController), for: .touchUpInside)
        view.addSubview(createCharButton)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: characterCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        view.addSubview(collectionView)
        
        setupConstraints()
        getCharacters()
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(getCharacters), userInfo: nil, repeats: true)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            createCharButton.topAnchor.constraint(equalTo: view.topAnchor),
            createCharButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            createCharButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            createCharButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: createCharButton.bottomAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    @objc func createViewController() {
        let viewController = CreateViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    //Networking
    @objc func getCharacters() {
        NetworkManager.getCharacters { characters in
            self.characters = characters
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func postCharacter(character: Character) {
        NetworkManager.postCharacter(character: character)
    }
    
    
    func deleteCharCell(char: Character, id: Int) {
        NetworkManager.deleteCharacter(character: char, ID: id)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension ViewController: CharacterToCellDelegate {
    func saveNewCharacter(to character: Character) {
        postCharacter(character: character)
        characters.append(character)
        //character
        let newIndexPath = NSIndexPath(item: characters.count-1, section: 0)
        collectionView.insertItems(at: [(newIndexPath as IndexPath)])
    }
}

extension ViewController: DeleteCellDelegate {
    func deleteCell(to cell: CharacterCollectionViewCell) {
        /*
         Delete cell from table
         
         Delete character from characterArray
         
         Delete character from database
         */
            //characters.remove(at: 1)
        
        //let path = self.collectionView.indexPath(for: cell)
        print("pong")
        print(characters)
        print(cell.char!)
        if let charIndex = self.characters.firstIndex(of: cell.char!) {
            print(charIndex)
        }
//        var i = 0
//        while(!(characters[i] == cell.char!)) {
//            print(characters[i] == cell.char!)
//            i = i+1
//        }
        //characters.remove(at: charIndex) // Find the array index given the character
        //deleteCharCell(char: cell.char!, id: cell.char!.id)
        //self.collectionView.deleteItems(at: [path!])
        //let newIndexPath = NSIndexPath(item: character.count, section: 0)
        self.collectionView.reloadData()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCellReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        cell.configure(for: characters[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 2 * padding) / 3.0
        let height = 2*(collectionView.frame.width - 2 * padding) / 3.0
        return CGSize(width: width, height: height)
    }
}
