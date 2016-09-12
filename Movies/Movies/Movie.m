//
//  Movie.m
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (Movie *)movieWithDictionary:(NSDictionary *)movieDict
{
    Movie *aMovie = nil;
    if (movieDict)
    {
        aMovie = [[Movie alloc] init];
        aMovie.movieTitle = movieDict[@"Title"];
        aMovie.movieTime = movieDict[@"Runtime"];
        aMovie.movieYear = movieDict[@"Year"];
        aMovie.movieImage = movieDict[@"Poster"];
        aMovie.public_repos = movieDict[@"public_repos"];
        aMovie.rated = movieDict[@"Rated"];
        aMovie.genre = movieDict[@"Genre"];
        aMovie.director = movieDict[@"Director"];
        aMovie.actors = movieDict[@"Actors"];
        aMovie.plot = movieDict[@"Plot"];
        aMovie.imdbRating = movieDict[@"imdbRating"];
    }
    
    return aMovie;
}

@end
