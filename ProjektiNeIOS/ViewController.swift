//
//  ViewController.swift
//  ProjektiNeIOS
//
//  Created by GentianVeliu on 7/9/20.
//  Copyright © 2020 GentianVeliu. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {
    
    var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("LojtaretDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db ) != SQLITE_OK{
            print("GABIM gjate hapjes te databazes")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Lojtaret (id INTEGER PRIMARY KEY AUTOINCREMENT, name1 Text, name2 Text)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Nuk u krijua tabela")
            return
        }
        print("Cdo gje eshte ne rregull")
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

