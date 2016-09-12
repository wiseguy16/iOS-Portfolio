//
//  OpeningViewController.m
//  Movies
//
//  Created by Gregory Weiss on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "OpeningViewController.h"
#import "MoviesTableViewController.h"

@interface OpeningViewController ()

@end

@implementation OpeningViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)gotoTapped:(UIButton *)sender
{
    MoviesTableViewController *newMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MoviesTableViewController"];
    [[self navigationController] pushViewController:newMovieVC animated:YES];
  
    
}

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    MoviesTableViewController *newMovieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GotoStartSegue"];
    [[self navigationController] pushViewController:newMovieVC animated:YES];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
