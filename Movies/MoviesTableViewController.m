//
//  MoviesTableViewController.m
//  Movies
//
//  Created by Komari Herring on 8/4/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "SearchOMDBViewController.h"
#import "APIController.h"
#import "Movie.h" 
#import "DetailMovieViewController.h" 
#import "OpeningViewController.h"

@interface MoviesTableViewController () <APIControllerProtocol, SearchTextFieldDelegate>

@property(strong, nonatomic) NSMutableArray *movies;
@property(strong, nonatomic) NSMutableArray *topMovies;

@end

@implementation MoviesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Movie Mania";
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.movies = [[NSMutableArray alloc] init];
    self.topMovies = [[NSMutableArray alloc] init];
    //    APIController *apiController = [[APIController alloc] init];
    //    apiController.delegate = self;
    //    [apiController searchGitHubFor:@"wiseguy16"];
    [self loadTopMovies];


}

- (void)didReceiveMemoryWarning
    {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTopMovies
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"movieMania" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *moviesArrayForJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aTopMovie in moviesArrayForJSON)
    {
        
        Movie *aMovie = [Movie movieWithDictionary:aTopMovie];
        [self.topMovies addObject:aMovie];
        
    }
    
    //    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    //    [self.heroes sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.topMovies.count;
    }
    else
    {
        return self.movies.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        Movie *aMovie = self.topMovies[indexPath.row];
        
        cell.textLabel.text = aMovie.movieTitle;
        cell.detailTextLabel.text = aMovie.genre;
        
        
    }
    else
    {
        Movie *aMovie = self.movies[indexPath.row];
        
        cell.textLabel.text = aMovie.movieTitle;
        cell.detailTextLabel.text = aMovie.movieYear;
        
        
    }
    // Configure the cell...
    //    Friend *aFriend = self.friends[indexPath.row];
    //
    //    cell.textLabel.text = aFriend.name;
    //    cell.detailTextLabel.text = aFriend.location;
    
    return cell;
}

// *******************WE WILL NEED METHOD didSelectRowAtIndexPath****************

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DetailMovieViewController *newMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailVC"];
    [[self navigationController] pushViewController:newMovieVC animated:YES];
    
    if (indexPath.section == 0)
    {
        Movie *selectedMovie = self.topMovies[indexPath.row];
        newMovieVC.movie = selectedMovie;
    }
    else
    {
        Movie *selectedMovie = self.movies[indexPath.row];
        newMovieVC.movie = selectedMovie;
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Current Popular Movies", @"mySectionName");
            break;
        case 1:
            sectionName = NSLocalizedString(@"Recently Searched Movies", @"myOtherSectionName");
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}




- (void)loadFriends
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor:@"wiseguy16"];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SearchGitHubSegue"])
    {
        SearchOMDBViewController *setDateVC = [segue destinationViewController];
        setDateVC.delegate = self;
    }
    
}


#pragma mark - Date Set delegate

-(void)searchWasTyped:(NSString *)userToLookUp
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor:userToLookUp];
    [self.tableView reloadData];
    
}

-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse
{
    Movie *aMovie = [Movie movieWithDictionary:gitHubResponse];
    [self.movies addObject:aMovie];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

@end
