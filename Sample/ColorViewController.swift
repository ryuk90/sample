//
//  ColorViewController.swift
//  Sample
//
//  Created by Mirko Saiu on 07/12/15.
//  Copyright © 2015 Mirko Saiu. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var colorHex: String = ""
    
    @IBOutlet var a: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        a.backgroundColor = UIColor(rgba: colorHex)
        
    }
}