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
            
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 320, self.seatView.frame.size.width, self.seatView.frame.size.height);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        if (IS_IPHONE_5)
        {
            
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [UIView animateWithDuration:1. delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    CGRect frame = CGRectMake(self.seatView.frame.origin.x, 20, self.seatView.frame.size.width, self.seatView.frame.size.height);
                    self.seatView.frame = frame;
                } completion:^(BOOL finished) {
                    
                }];
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
