//
//  MicroViewController.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MicroViewController : UIViewController

@property (nonatomic, assign) BOOL seatViewVisible;
@property (weak, nonatomic) IBOutlet UIView *seatView;

@end
