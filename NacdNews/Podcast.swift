//
//  Podcast.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation

class Podcast
{
    
    
    let channel: String
    let title: String
    let urltitle: String
    let entry_date: String
    let speaker: String
    let mediaFile: String
    let podcastImage: String
    
    
    init(myDictionary: [String: AnyObject])
    {
        
        channel = myDictionary["channel"] as! String
        title = myDictionary["title"] as! String
        urltitle = myDictionary["urltitle"] as! String
        entry_date = myDictionary["entry_date"] as! String
        speaker = myDictionary["media-speaker"] as! String
        mediaFile = myDictionary["media-file"] as! String
        podcastImage = myDictionary["media-primary"] as! String
    }
    
}