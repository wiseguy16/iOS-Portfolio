//
//  Movie.h
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject


@property (nonatomic) NSString *movieTitle;
@property (nonatomic) NSString *movieTime;
@property (nonatomic) NSString *movieYear;
@property (nonatomic) NSString *movieImage;
@property (nonatomic) NSNumber *public_repos;
@property (nonatomic) NSString *rated;
@property (nonatomic) NSString *genre;
@property (nonatomic) NSString *director;
@property (nonatomic) NSString *actors;
@property (nonatomic) NSString *plot;
@property (nonatomic) NSString *imdbRating;





+ (Movie *)movieWithDictionary:(NSDictionary *)movieDict;

@end
