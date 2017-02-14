//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by janusz jas on 09.02.2017.
//  Copyright © 2017 Janusz Pietkun. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    //pole nazwa
    @IBOutlet weak var TaskNameTextField: UITextField!
    
    //przycisk switch - zwraca bool wartosc - czy ważne/important
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    //tutaj na poczatku sciagniemy dane z pola nazwy i ważnosci a potem dodamy je w postaci tablicy do wczesniejszego widoku
    @IBAction func AddTapped(_ sender: Any) {
        //korzystamy znowu z clasy Task by stworzyć nowe zadanie
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = TaskNameTextField.text!
        // dzięki .isOn będziemy wiedzieć czy jest włączony czy nie
        task.important = importantSwitch.isOn
        //zapisujemy zmiany w core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //wyswietl dane
        
        //powrót do głownego widoku z dodanym już zadaniem
        
        navigationController!.popViewController(animated: true)
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

 

}
