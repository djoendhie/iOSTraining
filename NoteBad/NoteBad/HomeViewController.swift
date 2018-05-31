//
//  HomeViewController.swift
//  NoteBad
//
//  Created by Macbook Pro on 5/30/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
//import for your MEssage UI and Mail
import MessageUI
import Foundation


//add the implement method
class HomeViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func btnCall(_ sender: Any) {
        
        // your phone number
        let num: NSURL = URL(string: "TEL://+6285289587710")! as NSURL
        
        //set the action
        UIApplication.shared.open(num as URL, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func btnMessage(_ sender: Any) {
        
        //send message
        if MFMessageComposeViewController.canSendText() {
            let sendd = MFMessageComposeViewController()
            
            //set the body of your message
            sendd.body = "Body..."
            
            //this one for the destination for your message
            sendd.recipients = ["+6285289587710"]
            
            //the delegate
            sendd.messageComposeDelegate = self
            
            
            self.present(sendd, animated: true , completion: nil)
            
        }
        else {
            print("ERRORRRRRRRRRRRRRRRR")
        }
    }
    
    //the action when you`ve finished
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        //dismissing
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func btnMail(_ sender: Any) {
     
        let mailCompose = configureTheMail()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailCompose, animated: true , completion: nil)
            
        }
        //condition when thre`s an errorrr
        else {
            self.showAlertError()
        }
        
        
        
    }
    
    //set the body, destination and subject for your mail
    func configureTheMail() -> MFMailComposeViewController {
        
        let mailComposser = MFMailComposeViewController()
        mailComposser.mailComposeDelegate = self
        mailComposser.setToRecipients(["ihaandjoe68@gmail.com"])
        mailComposser.setSubject("Subject...")
        mailComposser.setMessageBody("Body..", isHTML: false)
        
        return mailComposser
        
    }
    
    // func for alert dialog to show the error
    func showAlertError() {
        
        let showAlert = UIAlertView(title: "Warning", message: "Errorrrrrrrrr", delegate: self, cancelButtonTitle: "OK")
        
        
        showAlert.show()
    }
    
    //to dissmissing
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
}









