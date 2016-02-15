//
//  ViewController.swift
//  Sample
//
//  Created by Mirko Saiu on 06/12/15.
//  Copyright © 2015 Mirko Saiu. All rights reserved.
//

import UIKit
import QuartzCore
import Parse
import ParseUI

class ViewController: UIViewController,  PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var square: UIView!
    var animator: UIDynamicAnimator!
   
    @IBOutlet weak var pageViewButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var gravityButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let loginViewController: PFLogInViewController = PFLogInViewController()
    let signupViewController: PFSignUpViewController = PFSignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func viewWillAppear(animated: Bool) {
        // IF LOGGED IN
        if(PFUser.currentUser() != nil) {
            registerButton.hidden = true
            loginButton.hidden = true
        }
            // IF NOT LOGGED IN
        else {
            
            logoutButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addGravity(sender: AnyObject) {
        animator = UIDynamicAnimator(referenceView: self.view)
        let gravity = UIGravityBehavior(items: [gravityButton,collectionButton, pageViewButton])
        animator.addBehavior(gravity)
        let collision = UICollisionBehavior(items: [gravityButton,collectionButton, pageViewButton])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        let behavior = UIDynamicItemBehavior(items: [gravityButton,collectionButton,pageViewButton])
        behavior.elasticity = 0.75
        animator.addBehavior(behavior)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if(PFUser.currentUser() == nil) {

            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .SignUpButton, .PasswordForgotten, .DismissButton]
            
            let logo = UILabel()
            logo.text = "Sample log in"
            
            loginViewController.delegate = self
            loginViewController.logInView?.logo = logo
            
            signupViewController.signUpView?.logo = logo
            signupViewController.delegate = self
            
            loginViewController.signUpController = signupViewController
        }
    }

    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Fail to log in.")
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if(!username.isEmpty || !password.isEmpty) {
            return false
        } else {
            return true
        }
    }
    
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Fail to sign up.")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User dismissed sign up.")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func goRegistration(sender: AnyObject) {
        
        performSegueWithIdentifier("registration", sender: self)
        
    }

    @IBAction func doLogout(sender: AnyObject) {
        PFUser.logOut()
        registerButton.hidden = false
        loginButton.hidden = false
        logoutButton.hidden = true
        
        print(PFUser.currentUser())
    }
}