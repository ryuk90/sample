//
//  LoginViewController.swift
//  Sample
//
//  Created by Mirko Saiu on 02/01/16.
//  Copyright © 2016 Mirko Saiu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    
    @IBAction func doLogin(sender: AnyObject) {
        
        activityIndicator.startAnimating()
        
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block: { (user, error) -> Void in
        
            
            self.activityIndicator.stopAnimating()
            
            if(user != nil) {
                let alert = UIAlertView(title: "Success", message: "Logged in", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
                
                self.performSegueWithIdentifier("home_login", sender: self)
            }
            else {
                
                let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "Ok")
                alert.show()
                
            }
            
        })
        
    }
}
