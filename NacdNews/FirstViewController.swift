//
//  FirstViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var poweredByLabel: UILabel!
    
    var launchString = "LAUNCH"
    var poweredByString = "POWERED BY NORTHLAND"
    var myMutableString1 = NSMutableAttributedString()
    var myMutableString2 = NSMutableAttributedString()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       // myMutableString2 = NSMutableAttributedString(string: String, attributes: [String : AnyObject]?)
//        myMutableString1 = NSMutableAttributedString(string: launchString,attributes: [NSFontAttributeName: UIFont(name: "GothamHTF-MediumCondensed", size: 95.0)!])
//        myMutableString2 = NSMutableAttributedString(string: poweredByString,attributes: [NSFontAttributeName:UIFont(name: "GothamHTF-MediumCondensed",size: 45.0)!])
//        
//        launchLabel.attributedText = myMutableString1
//        poweredByLabel.attributedText = myMutableString2
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

