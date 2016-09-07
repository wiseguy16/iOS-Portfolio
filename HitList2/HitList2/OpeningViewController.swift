//
//  OpeningViewController.swift
//  FingerPaints
//
//  Created by Gregory Weiss on 9/6/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class OpeningViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goToGalleryTapped(sender: UIButton)
    {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("GalleryViewController")
        self.showViewController(vc as! DrawingCollectionViewController, sender: vc)

        
    }
    
    
    /*
     let vc = self.storyboard!.instantiateViewControllerWithIdentifier("DrawingModalVC")
     self.showViewController(vc as! DrawingViewController, sender: vc)
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
