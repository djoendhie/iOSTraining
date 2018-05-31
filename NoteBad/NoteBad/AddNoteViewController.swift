//
//  AddNoteViewController.swift
//  NoteBad
//
//  Created by Macbook Pro on 5/28/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var edTitle: UITextField!
    
    @IBOutlet weak var etDesc: UITextField!
    
    @IBOutlet weak var etTime: UITextField!
    
    @IBOutlet weak var edPlace: UITextField!
    
    @IBOutlet weak var etDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        
        //making the context for our app
        let contexts = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //declaring aur task var
        let noteTask = Note(context: contexts)
        
        //for setting the entities to become just like waht we type inside the textField
        
        noteTask.noteTitle = edTitle.text
        noteTask.noteDate = etDate.text
        noteTask.noteDesc = etDesc.text
        noteTask.noteTime = etTime.text
        noteTask.notePlace = edPlace.text
        

        //the condition when we left our texts empty
        if edTitle.text == "" {
            //it`ll show an alert dialog
            let alert = UIAlertController(title: "Warning Title textField", message: "you cant leave it empty", preferredStyle: UIAlertControllerStyle.alert)
            
            //aading the cancel button/OK button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
            
            
        else if etDate.text == "" {
            let alert = UIAlertController(title: "Warnig Date TextField", message: "Fill IT!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
     
        
        else if etDesc.text == "" {
            let alert = UIAlertController(title: "warning Desc Field Text", message: "Make the Text", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Fine", style: .default, handler: nil))
        }
        
        else if etTime.text == "" {
            let alertTIme = UIAlertController(title: "Time is Empty", message: "Set the time", preferredStyle: UIAlertControllerStyle.alert)
            
            alertTIme.addAction(UIAlertAction(title: "Got IT", style: .default, handler: nil))
        }
        
        else if edPlace.text == "" {
            let alertPlace = UIAlertController(title: "Where`s the Place", message: "Set the Place", preferredStyle: UIAlertControllerStyle.alert)
            
            alertPlace.addAction(UIAlertAction(title: "Got IT", style: .default, handler: nil))
        }
            //the condition when the text is filled
            //the text will be saved to core Data and
            //show it on your table view controller
        else {
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            navigationController?.popViewController(animated: true)
            
            //print the result
            print("saved")
        }
    }
    
}












