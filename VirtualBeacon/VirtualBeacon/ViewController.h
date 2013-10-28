//
//  ViewController.h
//  VirtualBeacon
//
//  Created by Spencer Pieters on 28/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, CBPeripheralManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelInfo;

- (IBAction)playBeaconTapped:(id)sender;
- (IBAction)searchBeaconsTapped:(id)sender;

@end
