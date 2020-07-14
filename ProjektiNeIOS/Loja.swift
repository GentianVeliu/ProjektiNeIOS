//
//  Loja.swift
//  ProjektiNeIOS
//
//  Created by MajlindaJaha on 7/14/20.
//  Copyright © 2020 GentianVeliu. All rights reserved.
//

import UIKit


class Loja: UIViewController {

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
