//
//  ViewController.swift
//
//aby w 2 widoku ( po przejsciu plusTapped) nie wyswietlała się ikona < Do It a zamiast tego  < Wróc zmieniamy jej back button w opcjach




import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //podpinamy tabble View z pierszego widoku (tego)
    @IBOutlet weak var tableView: UITableView!
    
    // tworzymy pusta tablice typu Task
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dodajemy zadania do pustej jak narazie tablicy tasks - koniecznie przed tableView.datasource = self oraz delegate =  self - bo inaczej się nie wykona
        tasks = makeTasks()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // aby pozbyć się błedyu  musimy dodać UITableViewDelegat i DataSource po przecinku UIVewController w 11 linijce a potem dodac 2 funcke niezbędne ( numberOfRowInSection + cellForRowAt
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //tworzymy obiekt
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            
            cell.textLabel?.text =  "❗️\(task.name)"
        }else {
            
            cell.textLabel?.text =  task.name
        }
        
        return cell
    }
    
    //funckja tworząca 3 zadania na podstawie klasy Task
    func makeTasks() -> [Task] {
        
        let task1 = Task()
        task1.name = "Wyjdz z psem"
        task1.important = false
        
        let task2 = Task()
        task2.name = "kup śmietanę"
        task2.important = true
        
        let task3 = Task()
        task3.name = "wypij jogurt"
        task3.important = false
    
    return [task1, task2, task3]
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        //nil bo nic nie przesyłamy, addSegue bo tak nazwalismy przejscie do nowego  widoku
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    
    
    
    
    
    /*   komentujemy bo można usunąć, bo ta funckja wykona się wtedy tylko gdy skończy się pamięć w telefonie a przy prostych aplikacjach nie ma to sensu
     
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     */

}

