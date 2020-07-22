//
//  Loja.swift
//  ProjektiNeIOS
//
//  Created by MajlindaJaha on 7/14/20.
//  Copyright © 2020 GentianVeliu. All rights reserved.
//

import UIKit


class Loja: UIViewController {
    
    var lojtariAktiv = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var lojaEshteAktive = true
    
    
    let kombinimetFitores = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8],[2, 4, 6]]
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag-1] == 0 && lojaEshteAktive == true){
            
            gameState[sender.tag-1] = lojtariAktiv
            
            if (lojtariAktiv == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                lojtariAktiv = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                lojtariAktiv = 1
            }
            
        }
        
        for combination in kombinimetFitores
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]   {
                
                lojaEshteAktive = false;
                
                if gameState[combination[0]] == 1
                {
                
                    label.text = "X ka fituar"
                }
                else
                {
                   
                    label.text = "O ka fituar"
                }
                
                luajPerseriButoni.isHidden = false
                label.isHidden = false
                
            }
            
        }
        lojaEshteAktive = false
        for i  in gameState
        {
            if i == 0
            {
                lojaEshteAktive = true
                break
            }
            
        }
        if lojaEshteAktive == false
        {
            label.text = "Nuk ka fitues"
            luajPerseriButoni.isHidden = false
            label.isHidden = false
        }
        
    }
    
    
    
    
   
    
    @IBOutlet weak var luajPerseriButoni: UIButton!
    @IBAction func luajPerseri(_ sender: Any) {
    
    
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        lojaEshteAktive = true
        lojtariAktiv = 1
        
        luajPerseriButoni.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        
        
    }
    }
    
    
    
    
    @IBAction func btnDilni(_ sender: Any)
    {
        let njofto = UIAlertController(title: "TicTacToe", message: "A deshironi te dilni?", preferredStyle: .actionSheet)
        njofto.addAction(UIAlertAction(title: "Po", style: .destructive, handler: { (_) in exit(0)
            
        }))
        njofto.addAction(UIAlertAction(title: "Jo", style: .cancel, handler: nil))
        present(njofto, animated: true, completion: nil)    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmriLojtarit1.text = finalName1
        EmriLojtarit2.text = finalName2
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var EmriLojtarit1: UILabel!
    
    @IBOutlet weak var EmriLojtarit2: UILabel!
    
    var finalName1 = ""
    var finalName2 = ""
    
}
