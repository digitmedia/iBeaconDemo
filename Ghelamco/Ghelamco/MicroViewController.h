//
//  MicroViewController.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryPickerDelegate.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MicroViewController : UIViewController <CategoryPickerDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *manager;
    BOOL seatViewVisible;
    BOOL couponViewVisible;
}

@property (weak, nonatomic) IBOutlet UIView *seatView;
@property (weak, nonatomic) IBOutlet MKMapView *mapViewMain;
@property (weak, nonatomic) IBOutlet UIView *couponView;

@end
