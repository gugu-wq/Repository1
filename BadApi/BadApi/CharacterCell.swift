//
//  CharacterCell.swift
//  BadApi
//
//  Created by IACD-Air-10 on 2021/07/05.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterTitleLabel: UILabel!
    
    func setCharacter(character: Character) {
        characterImageView.image = character.image
        characterTitleLabel.text = character.title
    }
}
