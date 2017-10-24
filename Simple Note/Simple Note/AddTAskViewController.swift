//
//  AddTAskViewController.swift
//  Simple Note
//
//  Created by Gw on 24/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class AddTAskViewController: UIViewController {

    @IBOutlet weak var etNameTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func btnSaveTask(_ sender: Any) {
        //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deklarasi task
        let nameTask = Task(context: context) //deklarasi nameTask sebagai konteks dari entiti task
        nameTask.name_task = etNameTask.text //mendeklarasikan bahwa nameTask.name_task itu isi dari etNameTask.text
        
        //proses penyimpanan data ke core data
        //mengecek apakah nilai dari etTask adalah kosong atau tidak
        if etNameTask.text == "" {
            //jika kosong tampilkan dialog alert
            let alert = UIAlertController(title: "Warning", message: "Task Cant Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //kondisi ketika teks tasknya tidak kosong, data disimpan ke core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _ = navigationController?.popViewController(animated: true)
            //mencetak kalau data beerhasil ditambahkan
            print("Data Berhasil Disimpan")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
