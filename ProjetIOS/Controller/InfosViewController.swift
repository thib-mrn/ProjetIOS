//
//  InfosViewController.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 28/01/2021.
//

import UIKit

class InfosViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var color: UIImageView!
    @IBOutlet weak var back: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let bottle = data {
            name.text = bottle.name
            name.text = name.text?.uppercased()
            year.text = bottle.année
            country.text = bottle.pays
            state.text = bottle.region
            name.numberOfLines = 0
            
            if bottle.couleur == "Blanc" {
                color.image = UIImage(named: "BLANC")
                back.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 100/255, alpha: 0.5)
            }
            else if bottle.couleur == "Rouge" {
                color.image = UIImage(named: "RED")
                back.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 0.5)
               
            }
            else if bottle.couleur == "Rosé" {
                color.image = UIImage(named: "ROSE")
                back.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 226/255, alpha: 0.5)
            }
            else{
                color.image = UIImage(named: "CHAMP")
                back.backgroundColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 0.5)
            }
            
            
        }
    }
    

    
    var data : Result?
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
