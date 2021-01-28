//
//  BouteillesTableViewCell.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 15/01/2021.
//

import UIKit

class BouteillesTableViewCell: UITableViewCell {

    @IBOutlet weak var couleur: UIImageView!
    @IBOutlet weak var nomBouteille: UILabel!
    @IBOutlet weak var anneeBouteille: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
