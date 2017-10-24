//
//  NoteTableViewController.swift
//  Simple Note
//
//  Created by Gw on 24/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {

    // deklarasi variable task sebagai object
    var tasks : [Task] = [] //Task ini dipanggil dari eniti yang sudah dibuat tadi
    
    //deklarasi context untuk persintent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath)

        
        //deklarasi dataTask sebagai index dari tasks
        let dataTasks = tasks[indexPath.row]
        //mengambil data dengan atributs name_task
        if let myDataTask = dataTasks.name_task {
            //menampilkan data ke label
            cell.textLabel?.text = myDataTask
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method data()
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do {
            //kalau tidak ada, maka request downlad data
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
            //kondisi apabila eror fetch data
            print("Fetching Failed")
    }
    }
    
    //menambahkan data untuk delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //mengecek menu swipe apabila editing stylenya delete
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate) . saveContext()
            
            do {
                //retreive data
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
