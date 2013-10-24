//
//  MicroViewController.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryPickerDelegate.h"

@interface MicroViewController : UIViewController <CategoryPickerDelegate>

@property (nonatomic, assign) BOOL seatViewVisible;
@property (weak, nonatomic) IBOutlet UIView *seatView;
@property (weak, nonatomic) IBOutlet UIImageView *imagePointer1;
@property (weak, nonatomic) IBOutlet UIImageView *imagePointer2;
@property (weak, nonatomic) IBOutlet UIImageView *imagePointer3;

@end
