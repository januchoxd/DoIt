//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by janusz jas on 09.02.2017.
//  Copyright © 2017 Janusz Pietkun. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    var task : Task? = nil
  
    
    @IBOutlet weak var CompleteLabel: UILabel!
    
    @IBAction func CompleteButton(_ sender: Any) {
        //usuwamy zadanie
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        navigationController!.popViewController(animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
            
           CompleteLabel.text =  "❗️\(task!.name!)"
        }else {
            
            CompleteLabel.text =  task!.name!
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
