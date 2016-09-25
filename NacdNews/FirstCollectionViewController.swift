//
//  FirstCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FirstCollectionViewCell"

class FirstCollectionViewController: UICollectionViewController
{
    
    var mediaItems = [MediaItem]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        loadMediaItems()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return mediaItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FirstCollectionViewCell
    
        // Configure the cell
        
        let aMediaThing = mediaItems[indexPath.row]
        
        cell.firstTitleLabel.text = aMediaThing.title
        

        
        cell.firstDescriptionLabel.text = aMediaThing.media_speaker.uppercaseString
        cell.firstImageView.image = UIImage(named: aMediaThing.media_image)
        
 
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        let aVideoItem = mediaItems[indexPath.row] //as! BlogItem
      
            let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("VideoDetailViewController") as! VideoDetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
            detailVC.aVideo = aVideoItem
        
        
    }

    
    
        
        func loadMediaItems()
        {
            
            
            let filePath = NSBundle.mainBundle().pathForResource("nacdVideos", ofType: "json")
            let dataFromFile2 = NSData(contentsOfFile: filePath!)
            do
            {
                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(dataFromFile2!, options: [])    //jsonObject(with: dataFromFile2!, options: [])
                
                
                
                guard let jsonDict = jsonData as? [String: AnyObject],
                    let itemsArray = jsonDict["items"] as? [[String: AnyObject]]
                    else
                {
                    return
                }
                
                for anItemDict in itemsArray
                {
                    let aMediaItem = MediaItem(myDictionary: anItemDict)
                    mediaItems.append(aMediaItem)
                }
            }
            catch let error as NSError {
                print(error)
            }
        }

    

}
