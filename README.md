# RPG Character Creator
Design your own RPG-styled character!

## Appdev Hack Challenge Fall 2019 Team Members
* Ethan Keane Siapno (iOS/Backend)
* Christopher Janas (Backend)
* Akane Edwards (iOS/Asset Designer)

## Our App
Create and view RPG-styled characters created by users. Click on the "Create" Button to navigate to the page where you create a character. Use the arrows at the top to choose which aspect of your character you want to change. Users are able to customize characters outfits, eyes, hairstyles, and among other assets. When users are satisfied with their creations, they can hit "save" in order to add their new RPG character to the UICollectionView, for all other users to see.

All of the files used for the backend are in the folder named "backend" while all of the files for iOS are found in the folder named "CharacterCreator"

## Submitted Scope (for our graders)
* iOS
    * Completed Requirements
        * Integrated custom API built by backend developers. The a timer is used to send a GET request every 5 seconds to reload the data on the UICollectionView. Also, anytime a character is saved, a POST request is successfully sent which adds the character to the database, allowing all others users to eventually see the new character.
        * Navigation through UINavigationController
        * Usage of UICollectionView
        * AutoLayout through NSLayoutConstraint
    * Unimplemented
        * Unfortunately, we were unable to get the DELETE request to work in order to delete a character and its respective UICollectionViewCell and data from the database. Aside from that, the rest of the app works just as intended.
* Backend
    * Deployed the backend files to Docker and Google Cloud
        * External IP Address is found in the iOS folder, in CharacterCreator/CharacterCreator/NetworkManager.swift specifically.
    * Created GET, POST, and DELETE routes, all fully functional, with database modeling in mind.
        * GET requests at:
            * **/characters/** - get all characters
            * **/character/<int:id>/** - get a specific character
            * **/character/recent/** - get the most recently created character
        * POST request at:
            * **/character/** - create a create a character
            * **/character/<int:id>/** - edit a specific character
        * DELETE request at:
            * **/character/<int:id>/** - delete a specific character
            
