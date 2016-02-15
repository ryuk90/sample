//
//  ColorCollectionViewController.swift
//  Sample
//
//  Created by Mirko Saiu on 06/12/15.
//  Copyright © 2015 Mirko Saiu. All rights reserved.
//

import UIKit

class ColorCollectionViewController: UICollectionViewController {
    let colorsName = ["Yellow", "Red", "Green", "Blue"]
    let colorsHex = ["#FFFE8B", "#FF8881", "#A0FF95", "#95E7FF"]
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.colorsName.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        //cell.bgColor = UIColor(rgba: "#D00")
        cell.colorLabel.text = colorsName[indexPath.row]
        cell.colorLabel.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor(rgba: colorsHex[indexPath.row])
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showColor", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showColor"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let colorViewController = segue.destinationViewController as! ColorViewController
            colorViewController.colorHex = self.colorsHex[indexPath.row]
        }
    }
}
