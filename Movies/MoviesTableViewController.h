//
//  MoviesTableViewController.h
//  Movies
//
//  Created by Komari Herring on 8/4/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SearchTextFieldDelegate

-(void)searchWasTyped:(NSString *)userToLookUp;

@end

@protocol APIControllerProtocol

-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse;

@end

@interface MoviesTableViewController : UITableViewController

@end
