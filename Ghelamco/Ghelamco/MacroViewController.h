//
//  MacroViewController.h
//  Ghelamco
//
//  Created by Spencer Pieters on 18/11/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MacroViewController : UIViewController
{
    CLLocationCoordinate2D currentLocation;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapViewMain;

@end
