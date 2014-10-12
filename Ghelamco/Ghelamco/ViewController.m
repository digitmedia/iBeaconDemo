//
//  ViewController.m
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "ViewController.h"
#import "MacroViewController.h"
#import "MicroViewController.h"
#import "Helpers.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - initialisation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    microOpened = NO;
    
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;

    if ([manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [manager requestWhenInUseAuthorization];
    } else {
        [manager startUpdatingLocation];

        // ba74d9f8-a327-4b4c-b595-67980540f27c
        NSUUID *id = [[NSUUID alloc] initWithUUIDString:@"ba74d9f8-a327-4b4c-b595-67980540f27c"];
        
        CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id identifier:@"id1"];
        [manager startRangingBeaconsInRegion:region];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Gps data is momenteel niet beschikbaar." delegate:nil cancelButtonTitle:@"Sluiten" otherButtonTitles:nil];
    [alert show];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    if (!microOpened)
    {
        [self performSegueWithIdentifier:@"segueMicro" sender:self];
        
        microOpened = YES;
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    [self performSegueWithIdentifier:@"segueMacro" sender:self];
}

- (void)       locationManager: (CLLocationManager*)    manager
  didChangeAuthorizationStatus: (CLAuthorizationStatus) status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse: {
            [manager startUpdatingLocation];

            // ba74d9f8-a327-4b4c-b595-67980540f27c
            NSUUID *id = [[NSUUID alloc] initWithUUIDString:@"ba74d9f8-a327-4b4c-b595-67980540f27c"];
            
            CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id identifier:@"id1"];
            [manager startRangingBeaconsInRegion:region];
        } break;

        case kCLAuthorizationStatusNotDetermined: {
        } break;

        default: {
        }
    }
}

#pragma mark - Storyboards

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueMacro"])
    {
        
    }
    else if ([segue.identifier isEqualToString:@"segueMicro"])
    {
        
    }
}

#pragma mark - cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
