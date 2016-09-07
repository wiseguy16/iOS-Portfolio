//
//  DrawingCollectionViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "DrawingCell"

class DrawingCollectionViewController: UICollectionViewController
{
    
    var people = [NSManagedObject]()
    var myFormatter = NSDateFormatter()
    var ableToDelete = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The Gallery"
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        //3
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            people = results as! [Person]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        collectionView!.reloadData()
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "DetailSegue"
        {
            
        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return people.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! DrawingCell
    
        // Configure the cell...
        let person = people[indexPath.row] as! Person
        cell.nameLabel.text = person.name!
        
        
        let timeToShow = person.theDate!
        let formattedTime = myFormatter.stringFromDate(timeToShow)
        cell.dateLabel.text = formattedTime
        
        
        
        //let myData = person.valueForKey("theImage") as! NSData
        let myData = person.theImage! as NSData
        let myImage = UIImage(data: myData)
        
        cell.pictView.image = myImage
        
        if ableToDelete
        {
           cell.deleteButton.alpha = 0.75
        }
        else
        {
                cell.deleteButton.alpha = 0.0
        }

    
        return cell
    }

    @IBAction func addDrawingTapped(sender: UIBarButtonItem)
    {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("DrawingModalVC")
        self.showViewController(vc as! DrawingViewController, sender: vc)
        
    }
    
    
    @IBAction func deleteDrawingTapped(sender: UIBarButtonItem)
    {

        let tempString = ableToDelete ? "Edit": "Done"
        let tempColor = ableToDelete ? UIColor.grayColor() : UIColor.redColor()
        sender.title = tempString
        collectionView?.backgroundColor = tempColor
        ableToDelete = !ableToDelete
        
        collectionView!.reloadData()
        
        
    }
    
    
    func deleteName()
    {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        do {
            let personToDelete = people.last!
            people.removeAtIndex(people.count - 1)
            managedContext.deleteObject(personToDelete)
          try  managedContext.save()
            // people.removeLast()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        collectionView!.reloadData()
    }
    
    
    override func setEditing(editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        collectionView?.allowsMultipleSelection = editing
      //  toolBar.hidden = !editing
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        // managedContext.deleteObject(people.last!)
        
        if ableToDelete == false
        {
        let aPerson = people[indexPath.row] as! Person
        
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailDrawingViewController
        navigationController?.pushViewController(detailVC, animated: true)
        detailVC.aDrawing = aPerson
            
        }
        
        /*
         let vc = self.storyboard!.instantiateViewControllerWithIdentifier("DrawingModalVC")
         self.showViewController(vc as! DrawingViewController, sender: vc)
         */
        
        
        if ableToDelete == true
        {
        do {
            let personToDelete = people[indexPath.row]
       /*
            let deleteColor = UIColor.redColor()
            collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = deleteColor
       */
         
            people.removeAtIndex(indexPath.row)
            collectionView.deleteItemsAtIndexPaths([indexPath])
            managedContext.deleteObject(personToDelete)
            try  managedContext.save()
            } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            }
        }
        
    }
    
//    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        
//        
//        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        return true
//    }


    
//    // MARK: UICollectionViewDelegate
//
//    
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//
//    
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//
//    
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
//        return false
//    }
//
//    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
//    
//    }
    

}
