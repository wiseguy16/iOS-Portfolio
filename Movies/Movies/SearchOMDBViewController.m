//
//  SearchOMBDViewController.m
//  Movies
//
//  Created by Komari Herring on 8/6/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "SearchOMDBViewController.h"

@interface SearchOMDBViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchOMDBTextField;


@end

@implementation SearchOMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)searchTapped:(UIButton *)sender
{
    
    [self.delegate searchWasTyped:self.searchOMDBTextField.text]; 
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dismissTapped:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
