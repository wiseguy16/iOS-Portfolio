//
//  ThirdCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "ThirdCollectionViewCell"

class ThirdCollectionViewController: UICollectionViewController
{
    var audioPlayer: AVAudioPlayer!
    var isPlaying = false
    
    var podcastItems = [Podcast]()
    var myFormatter = NSDateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NSKernAttributeName.capitalizedString
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        
        loadPodcasts()

      
        // Do any additional setup after loading the view.
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return podcastItems.count
    }
    
    @IBAction func playPauseTapped(sender: UIButton)
    {
        isPlaying = !isPlaying
        let contentView = sender.superview
        let cell = contentView?.superview as! ThirdCollectionViewCell
        let thisIndexPath = collectionView?.indexPathForCell(cell)
        let aPodcast = podcastItems[thisIndexPath!.row]
        print("This cell")
        
        let playImage = UIImage(named: "podPlayIcon.png")
        let pauseImage = UIImage(named: "podPauseIcon.png")
        
        
        let audioString = aPodcast.mediaFile
        let audioFilePath =  NSBundle.mainBundle().pathForResource(audioString, ofType: "mp3")
        if audioFilePath != nil {
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath!) //   .fileURL(withPath: audioFilePath!)
            do {
                audioPlayer =  try AVAudioPlayer(contentsOfURL: audioFileUrl)      //(contentsOf: audioFileUrl)
            } catch let error1 as NSError {
                print(error1)
            }
        }
        if isPlaying
        {
            audioPlayer.play()
            sender.setImage(pauseImage, forState: .Normal)
        }
        else
        {
            audioPlayer.stop()
            sender.setImage(playImage, forState: .Normal)
        }
               
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThirdCollectionViewCell
    
        // Configure the cell
        
        
        let aPodcast = podcastItems[indexPath.row]
        
        cell.titleLabel.text = aPodcast.title
        cell.speakerLabel.text = aPodcast.speaker.uppercaseString
        cell.podcastImageView.image = UIImage(named: aPodcast.podcastImage)
//        if isPlaying
//        {
//        cell.playPauseButton.imageView?.image = UIImage(named: "podPauseIcon.png")
//        }
//        else
//        {
//            cell.playPauseButton.imageView?.image = UIImage(named: "podPlayIcon.png")
//        }
//  
        
        cell.layer.shadowOffset = CGSizeMake(10, 10)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.14
        
        // Maybe just me, but I had to add it to work:
        cell.clipsToBounds = false
        
        let shadowFrame: CGRect = (cell.layer.bounds)
        let shadowPath: CGPathRef = UIBezierPath(rect: shadowFrame).CGPath
        cell.layer.shadowPath = shadowPath
    
        return cell
    }
    
    
    func loadPodcasts()
    {
        
        
        let filePath = NSBundle.mainBundle().pathForResource("podcasts", ofType: "json")  //main.path(forResource: "nacdSample3", ofType: "json")
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
            
            for aPodDict in itemsArray
            {
                let aPodItem = Podcast(myDictionary: aPodDict)
                podcastItems.append(aPodItem)
            }
            // var finalItems = [MediaItem]()
        }
        catch let error as NSError {
            print(error)
        }
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
