//
//  NoteTableViewController.swift
//  NoteBad
//
//  Created by Macbook Pro on 5/28/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    //creating variable for the Note(CoreData) entitie
    var notes : [Note] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //variable for onclick
    var titleSelected:String?
    var dateSelected:String?
    var descSelected:String?
    var timeSelected:String?
    var placeSelected:String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NoteTableViewCell

        // Configure the cell...
        let noteTask = notes[indexPath.row]
        
        //taking the data from the atribute and put it on the labels on TableView Cell
        if let myNoteTask = noteTask.noteTitle{
            cell.lblTitle.text = myNoteTask
        }
        if let myNoteTask2 = noteTask.noteDate{
            cell.lblDate.text = myNoteTask2
        }
        if let myNoteTask3 = noteTask.noteDesc{
            cell.lblDesc.text = myNoteTask3
        }
        

        return cell
    }
    
    //add a new function to load your data
    override func viewWillAppear(_ animated: Bool) {
        //getting the Data using aother method
        getData()
        //reloading the data
        tableView.reloadData()
    }
    
    //method getData()
    func getData() {
        //chccking the errors
        do{
            //the condition when there is no error
            //it`ll request to download the data
            notes = try context.fetch(Note.fetchRequest())
        }
        catch{
            //the condition whene we got some errors
            print("Fail/Error/EXPLODED")
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //swipe to delete data
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = notes[indexPath.row]
            context.delete(task)
            
            //delete the data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrive your Data
                notes = try context.fetch(Note.fetchRequest())
            }catch{
                //print the error
                print("Error")
            }
        }
        //re-load data after delete one of it
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //checking the data that we wanna send
        print("Row \(indexPath.row)selected")
        
        let dataTask = notes[indexPath.row]
        
        //inputing the will be selected label to each of its var
        titleSelected = dataTask.noteTitle
        dateSelected = dataTask.noteDate
        descSelected = dataTask.noteDesc
        
        timeSelected = dataTask.noteTime
        placeSelected = dataTask.notePlace
        
        //prform the segue to the detailViewController
        performSegue(withIdentifier: "passData", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //checkin the segue
        if segue.identifier == "passData"{
            //condition on detected the segue
            //sending the data to detail...
            let sendData = segue.destination as! DetailViewController
            //sending the var of each data
            sendData.catchDate = dateSelected
            sendData.catchDesc = descSelected
            sendData.catchTime = timeSelected
            sendData.catchPlace = placeSelected
            sendData.catchTitle = titleSelected
        }
    }

}
