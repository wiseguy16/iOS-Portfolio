//
//  APIController.h
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoviesTableViewController.h"

@interface APIController : NSObject

@property (strong, nonatomic) id<APIControllerProtocol> delegate;

-(void)searchGitHubFor:(NSString *)searchTerm;

@end
