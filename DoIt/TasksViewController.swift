//
//  TasksViewController.swift
//
//aby w 2 widoku ( po przejsciu plusTapped) nie wyswietlała się ikona < Do It a zamiast tego  < Wróc zmieniamy jej back button w opcjach

    // 2 Bledy sa bo odjebalem z main.storyboard - usunalem cos potem dodalem na chama, ale dziala


import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //podpinamy tabble View z pierszego widoku (tego)
    @IBOutlet weak var tableView: UITableView!
    
    // tworzymy pusta tablice typu Task
    var tasks : [Task] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  koniecznie przed tableView.datasource = self oraz delegate =  self - bo inaczej się nie wykona
      
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // aby pozbyć się błedyu  musimy dodać UITableViewDelegat i DataSource po przecinku UIVewController w 11 linijce a potem dodac 2 funcke niezbędne ( numberOfRowInSection + cellForRowAt
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }
    //zostanie wykonane za karzdym razem gdy zostanie otworzony widok dany
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //tworzymy obiekt
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            
            cell.textLabel?.text =  "❗️\(task.name!)"
        }else {
            
            cell.textLabel?.text =  task.name!
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    
    //funckja tworząca 3 zadania na podstawie klasy Task
  
    
    @IBAction func plusTapped(_ sender: Any) {
        
        //nil bo nic nie przesyłamy, addSegue bo tak nazwalismy przejscie do nowego  widoku
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    //pobierz dane z core date do tablicy
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //potrzebne do try catch bo przy funckji był napis throws
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("oops we have an error")
        }
    }
    
    
    //funkcja do odpierania zadan z createTaskViewControlera
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if zeby bylo wiadomo ktorego segue uzyc bo sa 2 na tym widoku
       
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            
    }
    
    
    }
    
    /*   komentujemy bo można usunąć, bo ta funckja wykona się wtedy tylko gdy skończy się pamięć w telefonie a przy prostych aplikacjach nie ma to sensu
     
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     */

}

