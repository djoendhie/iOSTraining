//
//  DetailViewController.swift
//  NoteBad
//
//  Created by Macbook Pro on 5/28/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailPlace: UILabel!
    
    @IBOutlet weak var detailDate: UILabel!
    
    @IBOutlet weak var detailTime: UILabel!
    
    @IBOutlet weak var detailDesc: UILabel!
    
    //variable to catch data that we send from NoteTableViewController
    var catchTitle:String? = nil
    var catchPlace:String? = nil
    var catchDate:String? = nil
    var catchTime:String? = nil
    var catchDesc:String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //show the data that we just catch
        detailTitle.text = "" + catchTitle!
        detailDate.text = "" + catchDate!
        detailTime.text = "" + catchTime!
        detailPlace.text = "" + catchPlace!
        detailDesc.text = "" + catchDesc!
        
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
