//
//  ConfigController.h
//  VirtualBeacon
//
//  Created by Spencer Pieters on 28/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigController : UIViewController <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *labelUUID;
@property (weak, nonatomic) IBOutlet UITextField *labelMajor;
@property (weak, nonatomic) IBOutlet UITextField *labelMinor;

@end
