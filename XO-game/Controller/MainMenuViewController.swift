//
//  MainMenuViewController.swift
//  XO-game
//
//  Created by Maksim on 24.07.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func playGameTwoPlayersBtnWasPrssd(_ sender: Any) {
        guard let view = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as? GameViewController else { return }
        //TO DO -> configure vc
        //по умолчанию false
        //view.gameVsComputer = false
        present(view, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func playGameWithComputers(_ sender: Any) {
        guard let view = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as? GameViewController else { return }
        //TO DO -> configure vc
        view.gameVsComputer = true
        
        present(view, animated: true, completion: nil)
    }
    
}
