//
//  SearchOMBDViewController.h
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviesTableViewController.h"

@interface SearchOMDBViewController : UIViewController

@property (nonatomic) id<SearchTextFieldDelegate> delegate;

@end
