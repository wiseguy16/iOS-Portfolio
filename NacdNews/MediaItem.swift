//
//  MediaItem.swift
//  FrameworkDesign1
//
//  Created by Gregory Weiss on 8/23/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation

class MediaItem
{
   // let items: [[String: AnyObject]]
   // let itemsDict: [String:AnyObject]
    
    let title: String
    let media_speaker: String
    
    let entry_id: Int
    let channel: String
    
    let urltitle: String
    let entry_date: String
 //   let categories: String
 //   let tags: String
   let media_description: String
//    let media_reference: String
    
 //   let media_week: Int
//    let media_video: Int
//    let media_podcast: Bool
//    let media_embed: Int
    let media_image: String
//    let media_primary: String
//    let media_live: Bool
 
  //  let media_unit: String
  //  let unit_entry_id: Int
//    let unit_channel: String
  //  let unit_title: String
//    let unit_urltitle: String
//    let media_youtube_id: String
    let media_vimeo_m3u8_id: String

   // let blog_primary: String
   
   
    
    init(myDictionary: [String: AnyObject])
    {
        //itemsDict = myArray[0]
       // items = dictionary["items"] as! [[String:AnyObject]]
       // itemsDict = items[0]
       // itemsDict = myArray[0]
        
        title = myDictionary["title"] as! String
        media_speaker = myDictionary["media-speaker"] as! String
        
        entry_id = myDictionary["entry_id"] as! Int
        channel = myDictionary["channel"] as! String
        
        urltitle = myDictionary["urltitle"] as! String
        entry_date = myDictionary["entry_date"] as! String
    //  categories = myDictionary["categories"] as! String
    //    tags = myDictionary["tags"] as! String
      media_description = myDictionary["media-description"] as! String
//        media_reference = myDictionary["media-reference"] as! String
        
   //   media_week = myDictionary["media-week"] as! Int
//        media_video = myDictionary["media-video"] as! Int
  //      media_podcast = myDictionary["media-podcast"] as! Bool
//        media_embed = myDictionary["media-embed"] as! Int
        media_image = myDictionary["media-primary"] as! String
    //    media_primary = myDictionary["media-primary"] as! String
      //  media_live = myDictionary["media-live"] as! Bool
     
//        media_unit = myDictionary["media-unit"] as! String
//
  //      unit_entry_id = myDictionary["entry_id"] as! Int
    //    unit_channel = myDictionary["channel"] as! String
      //  unit_title = myDictionary["title"] as! String
//        unit_urltitle = myDictionary["urltitle"] as! String
  //      media_youtube_id = myDictionary["media-youtube-id"] as! String
        media_vimeo_m3u8_id = myDictionary["media-vimeo-m3u8-id"] as! String
        
      //  blog_primary = myDictionary["blog_primary"] as! String
 
    }
    

}

