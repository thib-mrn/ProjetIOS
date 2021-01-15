//
//  ViewController.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 08/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gestion: [UIButton]!
    @IBOutlet weak var titre: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
}

