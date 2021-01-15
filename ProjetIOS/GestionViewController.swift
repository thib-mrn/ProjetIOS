//
//  GestionViewController.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 15/01/2021.
//

import UIKit

class GestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BouteillesTableView.dequeueReusableCell(withIdentifier: "bouteillesCell", for : indexPath) as! BouteillesTableViewCell
        let row = indexPath.row
        
        cell.backgroundColor = UIColor.clear
        
        cell.nomBouteille.text = data[row].name
        cell.anneeBouteille.text = data[row].année
       if data[row].couleur == "Blanc" {
            
            cell.couleur.image = UIImage(named: "grapes")
        }
        else if data[row].couleur == "Rouge" {
            cell.couleur.image = UIImage(named: "grapes")
        }
        else {
            cell.couleur.image = UIImage(named: "grapes")
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "bouteilles", ofType: "json") {
            if let str = try? String(contentsOfFile: path) {
                let rawData = Data(str.utf8)
                if let jsonData = try? JSONDecoder().decode(Bouteilles.self, from: rawData){
                    data = jsonData.result
                    data.sort{$0.name < $1.name}
                    
                    print(data.count)
                    for p in data{
                        print(p.name)
                    }
                }
                else{
                    errorMsg = "ERROR : No JSON data"
                }
            }
            else{
                errorMsg = "ERROR : No TXT data"
            }
        }
        else{
            errorMsg = "ERROR : No PATH found"
        }
        
        if let error = errorMsg {
            print(error)
        }
        
        BouteillesTableView.dataSource = self
        BouteillesTableView.delegate = self
    }
    
    @IBOutlet weak var BouteillesTableView: UITableView!
    
    var data: [Result] = []
    var errorMsg: String?
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Je l'ai bu!", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.data.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })
        ])
        
        return configuration
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
