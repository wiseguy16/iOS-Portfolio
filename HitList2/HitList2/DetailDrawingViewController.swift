//
//  DetailDrawingViewController.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/27/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class DetailDrawingViewController: UIViewController
{
    
    var aDrawing: Person!
    var detailFormatter = NSDateFormatter()
    
    
    @IBOutlet weak var detailDrawingView: UIImageView!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
      
    @IBOutlet weak var detailDateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailFormatter.dateStyle = .ShortStyle
        detailFormatter.timeStyle = .NoStyle
        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView()
    {
        
        detailTitleLabel.text = aDrawing.name
        
        let timeToShow = aDrawing.theDate!
        let formattedTime = detailFormatter.stringFromDate(timeToShow)
        detailDateLabel.text = formattedTime
        
        
        let myData = aDrawing.theImage!
        let myImage = UIImage(data: myData)
        
        detailDrawingView.image = myImage
        
    }
    
    @IBAction func shareTapped(sender: UIBarButtonItem)
    {
        let myData = aDrawing.theImage!
        let myImage = UIImage(data: myData)
        
       // detailDrawingView.image = myImage
        
        
        let vc = UIActivityViewController(activityItems: [myImage!], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
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
