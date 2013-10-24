//
//  CategoryViewController.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryPickerDelegate.h"

@interface CategoryViewController : UIViewController

@property (nonatomic, weak) id<CategoryPickerDelegate> delegate;

- (IBAction)buttonToiletsTapped:(id)sender;
- (IBAction)buttonDrinksTapped:(id)sender;
- (IBAction)buttonFoodTapped:(id)sender;
- (IBAction)buttonMerchandisingTapped:(id)sender;

@end
