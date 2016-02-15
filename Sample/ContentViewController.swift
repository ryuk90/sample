//
//  ContentViewController.swift
//  Sample
//
//  Created by Mirko Saiu on 26/12/15.
//  Copyright © 2015 Mirko Saiu. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFileName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelText.text = self.titleText
        self.image.image = UIImage(named: self.imageFileName)
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

}
