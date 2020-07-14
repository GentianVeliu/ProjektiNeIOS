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
    
    @IBAction func ShikoHistorikun(_ sender: UIButton) {
        
        let nextView:Historiku = storyboard?.instantiateViewController(withIdentifier: "Historikuid") as! Historiku
        
        self.navigationController?.pushViewController(nextView, animated:true)
    }
    
    
    var db: OpaquePointer?

    @IBOutlet weak var ObjLojtari1: UITextField!
    
    @IBOutlet weak var ObjLojtari2: UITextField!
    
    var nameText1 = ""
    var nameText2 = ""
    
    @IBAction func BtnRuaj(_ sender: Any) {
        let lojt1 = ObjLojtari1.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lojt2 = ObjLojtari2.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if(lojt1?.isEmpty)! {
            	print("Lojtari1 nuk eshte shenuar!")
            return;
        }
        
        if(lojt2?.isEmpty)! {
            print("Lojtari2 nuk eshte shenuar!")
            return;
        }
        
        var stmt: OpaquePointer?
        let insertQuery = "INSERT INTO Lojtaret (lojt1, lojt2) VALUES(?, ?)"
        
        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK
        {
            print("Error binding query")
        }
        if sqlite3_bind_text(stmt, 1, lojt1, -1, nil) != SQLITE_OK
        {
            print("Error binding lojtari1")
        }
        if sqlite3_bind_text(stmt, 2, lojt2, -1, nil) != SQLITE_OK
        {
            print("Error binding lojtari2")
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE
        {
            print("Lojtaret jane ruajtur me sukses")
        }
        
    }
    
    @IBAction func Luaj(_ sender: Any) {
        
        self.nameText1 = ObjLojtari1.text!
        self.nameText2 = ObjLojtari2.text!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc  = segue.destination as! Loja
        vc.finalName1 = nameText1
        vc.finalName2 = nameText2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("LojtaretDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db ) != SQLITE_OK{
            print("GABIM gjate hapjes te databazes")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Lojtaret (id INTEGER PRIMARY KEY AUTOINCREMENT, lojt1 Text, lojt2 Text)"
        
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

