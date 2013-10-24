//
//  CategoryViewController.m
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "CategoryViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

#pragma mark - initialisation

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - actions

- (IBAction)buttonToiletsTapped:(id)sender
{
    [self.delegate categoryDidReceiveTap:0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonDrinksTapped:(id)sender
{
    [self.delegate categoryDidReceiveTap:0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonFoodTapped:(id)sender
{
    [self.delegate categoryDidReceiveTap:0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonMerchandisingTapped:(id)sender
{
    [self.delegate categoryDidReceiveTap:0];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
