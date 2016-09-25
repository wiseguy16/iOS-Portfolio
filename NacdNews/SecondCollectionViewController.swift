//
//  SecondCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SecondCollectionViewCell"

class SecondCollectionViewController: UICollectionViewController
{
    
    var blogItems = [BlogItem]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        
        loadBlogs()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blogItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SecondCollectionViewCell
    
        // Configure the cell
        
        let aBlog = blogItems[indexPath.row]
       // var imageData: NSData
        
        cell.secondTitleLabel.text = aBlog.title
        

        
        cell.secondDescriptionLabel.text = aBlog.author.uppercaseString
        cell.secondImageView.image = UIImage(named: aBlog.blog_primary)
        
        
    
        return cell
    }
    
    func loadBlogs()
    {
        
        
        let filePath = NSBundle.mainBundle().pathForResource("nacdBlog3", ofType: "json")  //main.path(forResource: "nacdSample3", ofType: "json")
        let dataFromFile2 = NSData(contentsOfFile: filePath!)                   //      (contentsOf: URL(fileURLWithPath: filePath!))
        do
        {
            
            let jsonData = try NSJSONSerialization.JSONObjectWithData(dataFromFile2!, options: [])    //jsonObject(with: dataFromFile2!, options: [])
            
            
            
            guard let jsonDict = jsonData as? [String: AnyObject],
                let itemsArray = jsonDict["items"] as? [[String: AnyObject]]
                //let itemsArray = items1["item"] as? [[String: Any]]
                else
            {
                return
            }
            
            for aBlogDict in itemsArray
            {
                let aBlogItem = BlogItem(myDictionary: aBlogDict)
                blogItems.append(aBlogItem)
            }
            // var finalItems = [MediaItem]()
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
       let aBlog = blogItems[indexPath.row] //as! BlogItem
            let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("BlogDetailViewController") as! BlogDetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
            detailVC.aBlogItem = aBlog
 
        
    }

    


}
