//
//  AffichageViewController.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 28/01/2021.
//

import UIKit

class AffichageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var BouteilleCollectionView: UICollectionView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
       
        cell.myLabel.text = self.items[indexPath.row]
        for p in data {
            if indexPath.row == p.place-1 {
                if p.couleur == "Blanc" {
                    cell.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 100/255, alpha: 0.7)
                }
                else if p.couleur == "Rouge" {
                    cell.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 0.7)
                }
                else if p.couleur == "Rosé" {
                    cell.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 226/255, alpha: 0.7)
                }
                else if p.couleur == "Champagne" {
                    cell.backgroundColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 0.7)
                }
            }
        }
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 24
        return cell
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bouteilles", ofType: "json") {
            if let str = try? String(contentsOfFile: path) {
                let rawData = Data(str.utf8)
                if let jsonData = try? JSONDecoder().decode(Bouteilles.self, from: rawData){
                    data = jsonData.result
                    data.sort{$0.place < $1.place}
                    
                    for p in data {
                        print(p.place)
                    }
                }
                else{
                    errorMsg2 = "ERROR : No JSON data"
                }
            }
            else{
                errorMsg2 = "ERROR : No TXT data"
            }
        }
        else{
            errorMsg2 = "ERROR : No PATH found"
        }

    }
    
    var data: [Result] = []
    var errorMsg2: String?
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    // change background color when user touches cell
    func collectionView( _ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.yellow
    }

    // change background color back when user releases touch
    func collectionView( _ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
}
