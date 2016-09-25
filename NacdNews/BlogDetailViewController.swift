//
//  BlogDetailViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/31/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import WebKit

class BlogDetailViewController: UIViewController {
    
    @IBOutlet weak var blogScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var aBlogItem: BlogItem!
    var shareBody: String?
    
    @IBOutlet weak var blogImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTextLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    

  //  @IBOutlet weak var awesomeWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareBody = aBlogItem.body
        configureView()
        
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews();
        
        self.blogScrollView.frame = self.view.bounds; // Instead of using auto layout
        self.blogScrollView.contentSize.height = 3000; // Or whatever you want it to be.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sharingTapped(sender: UIButton)
    {
        let vc = UIActivityViewController(activityItems: [shareBody!], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    func configureView()
    {
        titleLabel.text = aBlogItem.title
        authorLabel.text = aBlogItem.author.uppercaseString
        dateLabel.text = aBlogItem.entry_date
        subTextLabel.text = aBlogItem.subText
        bodyLabel.text = aBlogItem.body
        bioLabel.text = aBlogItem.bioDisclaimer
        blogImage.image = UIImage(named: aBlogItem.blog_primary)
        
    }


}
