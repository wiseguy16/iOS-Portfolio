//
//  DrawingViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/26/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import CoreData

class DrawingViewController: UIViewController
{

    @IBOutlet weak var gestureNameLabel: UILabel!
    
    @IBOutlet weak var canvas: UIImageView!
    
    // CocoaPod stuff
    @IBOutlet weak var colorPicker: SwiftHSVColorPicker!
    @IBOutlet weak var colorButtonOutlet: UIButton!
    
    var selectedColor: UIColor = UIColor.magentaColor()
    var colorToUse = UIColor.magentaColor()
    var adjustableLineWidth: CGFloat = 1
    
    var start: CGPoint?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        colorPicker.setViewColor(selectedColor)
        colorButtonOutlet.enabled = false
        adjustableLineWidth = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearImage(sender: UIBarButtonItem)
    {
        canvas.image = nil
        
    }

    @IBAction func goBackTapped(sender: UIBarButtonItem)
    {
       // HitListTableViewController().tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
 
    @IBAction func getSelectedColor(sender: UIButton)
    {
        let selectedColor = colorPicker.color
        colorPicker.alpha = 0.0
        colorButtonOutlet.alpha = 0.0
        colorButtonOutlet.enabled = false
        colorToUse = selectedColor
        
        canvas.alpha = 1.0
        
        
        
        print(selectedColor)
        
        
    }
    
    @IBAction func pickColorTapped(sender: UIBarButtonItem)
    {
        colorPicker.alpha = 1.0
        colorButtonOutlet.alpha = 1.0
        colorButtonOutlet.enabled = true
        
        canvas.alpha = 0.0
        
    }
    
    @IBAction func pinched(sender: UIPinchGestureRecognizer)
    {
        if sender.state == .Ended
        {
            print("pinched")
            let widthNow = sender.scale
            adjustableLineWidth = widthNow * 5
            print(widthNow)
            
        }
        
    }
    
    
    @IBAction func saveDrawing(sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Save Drawing", message: "Add a new name", preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: {
            (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.last
            self.saveName(textField!.text!)
           // self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
            (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
  
    func saveName(name: String)
    {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Person
        
        //3
        person.name = name
        
        
        let currentDate = NSDate()
        // let thisIsTheTime = myFormatter.stringFromDate(currentDate)
        person.theDate = currentDate
        
        
        let imageData = UIImagePNGRepresentation(makeImage())
        person.theImage = imageData
        
        //4
        do {
            managedContext.insertObject(person)
            try managedContext.save()
            //5
           // people.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func makeImage() -> UIImage
    {
        
        
        UIGraphicsBeginImageContext(self.canvas.bounds.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return viewImage
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first
        start = touch!.locationInView(view)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first
        let end = touch!.locationInView(view)
        if let start = self.start
        {
            drawFromPoint(start, toPoint: end)
        }
        self.start = end
    }
    
    func drawFromPoint(start: CGPoint, toPoint end: CGPoint)
    {
        // set the context to that of an image
        UIGraphicsBeginImageContext(canvas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        // draw the existing image onto the current context
        canvas.image?.drawInRect(CGRect(x: 0, y: 0,
            width: canvas.frame.size.width, height: canvas.frame.size.height))
        // draw the new line segment
        CGContextSetLineWidth(context, adjustableLineWidth)
        CGContextSetStrokeColorWithColor(context, colorToUse.CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        // obtain a UIImage object from the context
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // set the UIImageView's image to the new, generated image
        canvas.image = newImage
    }

    func showGestureName()
    {
        gestureNameLabel.text = "Drawing Saved"
        UIView.animateWithDuration(1.0, animations: {
            self.gestureNameLabel.alpha = 1
            }, completion: {
                _ in
                UIView.animateWithDuration(1.0, animations: {
                    self.gestureNameLabel.alpha = 0
                })
        })
        
        
    }

    
    
    
    
    
    

}
