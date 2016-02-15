//
//  RegistrationController.swift
//  Sample
//
//  Created by Mirko Saiu on 01/01/16.
//  Copyright © 2016 Mirko Saiu. All rights reserved.
//

import UIKit
import Parse

class RegistrationController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.keyboardType = UIKeyboardType.EmailAddress
        
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doRegistration(sender: AnyObject) {
        
        
        activityIndicator.startAnimating()
        
        let newUser = PFUser()
        
        newUser.username = username.text
        newUser.email = email.text
        newUser.password = password.text
        
        
        
        
        
        newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            
            
            self.activityIndicator.stopAnimating()
            
            if(error != nil) {
                let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
            } else {
                let alert = UIAlertView(title: "Success", message: "Sign up", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
                
            }
            
            print(PFUser.currentUser())
            
            self.performSegueWithIdentifier("home", sender: self)
        
        
        })
    }
}
