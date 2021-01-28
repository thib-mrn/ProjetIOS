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
            
        cell.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 100/255, alpha: 0.5)
            cell.couleur.image = UIImage(named: "BLANC")
        }
        else if data[row].couleur == "Rouge" {
            cell.couleur.image = UIImage(named: "RED")
            cell.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 0.5)
        }
        else if data[row].couleur == "Rosé" {
            cell.couleur.image = UIImage(named: "ROSE")
            cell.backgroundColor = UIColor(red: 255/255, green: 80/255, blue: 226/255, alpha: 0.5)
        }
        else{
            cell.backgroundColor = UIColor(red: 39/255, green: 174/255, blue: 96/255, alpha: 0.5)
            cell.couleur.image = UIImage(named: "CHAMP")
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BouteillesTableView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewCont = segue.destination as? InfosViewController {
            let row = BouteillesTableView.indexPathForSelectedRow!.row
            viewCont.data = data[row]
        }
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
