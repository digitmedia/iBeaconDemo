//
//  MicroViewController.m
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "MicroViewController.h"
#import "Helpers.h"

@interface MicroViewController ()

@end

@implementation MicroViewController

#pragma mark - initialisation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Venue";
    self.seatViewVisible = NO;
    
    UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seatViewTapped:)];
    [self.seatView addGestureRecognizer:r];
}

#pragma mark - actions

- (void)seatViewTapped:(id)sender
{
    if (self.seatViewVisible)
    {
        if (IS_IPHONE_5)
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 455, self.seatView.frame.size.width, 474);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 367, self.seatView.frame.size.width, 396);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        if (IS_IPHONE_5)
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 30, self.seatView.frame.size.width, 474);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 20, self.seatView.frame.size.width, 396);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    self.seatViewVisible = !self.seatViewVisible;
}

#pragma mark - cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
