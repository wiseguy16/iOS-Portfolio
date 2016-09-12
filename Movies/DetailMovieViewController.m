//
//  DetailMovieViewController.m
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "DetailMovieViewController.h"

@interface DetailMovieViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratedLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UITextView *plotTextView;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *imdbLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

- (void)configureView;

@end

@implementation DetailMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail view

- (void)setMovie:(Movie *)newMovie
{
    if (_movie != newMovie)
    {
        _movie = newMovie;
        
        // Update the view.
        [self configureView];
    }
}



#pragma mark - Configure the view

- (void)configureView
{
    if (self.movie)
    {
        self.title = [NSString stringWithFormat: @"Movie Mania"];
        self.titleLabel.text = self.movie.movieTitle;
        self.timeLabel.text = self.movie.movieTime;
        self.yearLabel.text = self.movie.movieYear;
        self.ratedLabel.text = self.movie.rated;
        self.genreLabel.text = self.movie.genre;
        self.directorLabel.text = self.movie.director;
        self.castLabel.text = self.movie.actors;
        self.plotTextView.text = self.movie.plot;
        self.imdbLabel.text = self.movie.imdbRating;
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.movie.movieImage]];
        // cell.image = [UIImage imageWithData: imageData];
        
        self.movieImageView.image = [UIImage imageWithData: imageData];
        // [imageData release];
        
        
    }
    
}





@end
