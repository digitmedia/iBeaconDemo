//
//  MicroViewController.m
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "MicroViewController.h"
#import "Helpers.h"
#import "CategoryViewController.h"
#import <MapKit/MapKit.h>
#import "LocalMicroTileOverlay.h"

@interface MicroViewController ()

@end

@implementation MicroViewController

#pragma mark - initialisation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Venue";
    seatViewVisible = NO;
    couponViewVisible = NO;
    
    archivedCoupons = [[NSMutableArray alloc] init];
    
    manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    [manager startUpdatingLocation];
    
    // ba74d9f8-a327-4b4c-b595-67980540f27c
    NSUUID *id = [[NSUUID alloc] initWithUUIDString:@"ba74d9f8-a327-4b4c-b595-67980540f27c"];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id identifier:@"id1"];
    region.notifyEntryStateOnDisplay = YES;
    [manager startRangingBeaconsInRegion:region];
    [manager startMonitoringForRegion:region];
    
    UITapGestureRecognizer *r1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seatViewTapped:)];
    [self.seatView addGestureRecognizer:r1];
    
    UITapGestureRecognizer *r2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(couponViewTapped:)];
    [self.couponView addGestureRecognizer:r2];
    
    self.mapViewMain.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(51.016104,3.733828), MKCoordinateSpanMake(0.003, 0.003));
    
    LocalMicroTileOverlay *tileOverlay = [[LocalMicroTileOverlay alloc] initWithURLTemplate:@""];
    
    tileOverlay.canReplaceMapContent = NO;
    tileOverlay.minimumZ = 15;
    tileOverlay.maximumZ = 21;
    [_mapViewMain addOverlay:tileOverlay];
}

#pragma mark - actions

- (void)seatViewTapped:(id)sender
{
    if (seatViewVisible)
    {
        if (IS_IPHONE_5)
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 505, self.seatView.frame.size.width, 474);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.seatView.frame.origin.x, 417, self.seatView.frame.size.width, 396);
                self.seatView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        
        // Markeer als gearchiveerd
        
        [archivedCoupons addObject:@"seat"];
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
    
    seatViewVisible = !seatViewVisible;
}

- (void)couponViewTapped:(id)sender
{
    if (couponViewVisible)
    {
        if (IS_IPHONE_5)
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.couponView.frame.origin.x, 505, self.couponView.frame.size.width, 474);
                self.couponView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.couponView.frame.origin.x, 417, self.couponView.frame.size.width, 396);
                self.couponView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        
        // Markeer als gearchiveerd
        
        [archivedCoupons addObject:@"coupon"];
    }
    else
    {
        if (IS_IPHONE_5)
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.couponView.frame.origin.x, 30, self.couponView.frame.size.width, 474);
                self.couponView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [UIView animateWithDuration:0.4 delay:0. options:UIViewAnimationOptionCurveEaseInOut animations:^{
                CGRect frame = CGRectMake(self.couponView.frame.origin.x, 20, self.couponView.frame.size.width, 396);
                self.couponView.frame = frame;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    couponViewVisible = !couponViewVisible;
}

#pragma mark - CategoryPickerDelegate

- (void)categoryDidReceiveTap:(NSInteger)type
{
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    NSArray *currentBeacons = [beacons sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        CLBeacon *beacon1 = (CLBeacon*)obj1;
        CLBeacon *beacon2 = (CLBeacon*)obj2;
        
        // Score berekenen van 1 en 2
        
        NSInteger proximityScore1 = 0;
        NSInteger proximityScore2 = 0;
        
        if (beacon1.proximity != CLProximityUnknown)
        {
            proximityScore1 = 10 / beacon1.proximity;
        }
        else
        {
            proximityScore1 = 1;
        }
        
        if (beacon2.proximity != CLProximityUnknown)
        {
            proximityScore2 = 10 / beacon2.proximity;
        }
        else
        {
            proximityScore2 = 1;
        }
        
        NSInteger distanceScore1 = 0;
        NSInteger distanceScore2 = 0;
        
        if (beacon1.accuracy != 0)
        {
            distanceScore1 = 10 / beacon1.accuracy;
        }
        else
        {
            distanceScore1 = 1;
        }
        
        if (beacon2.accuracy != 0)
        {
            distanceScore2 = 10 / beacon2.accuracy;
        }
        else
        {
            distanceScore2 = 1;
        }
        
        NSInteger score1 = proximityScore1 * distanceScore1;
        NSInteger score2 = proximityScore2 * distanceScore2;
        
        if (score1 < score2)
        {
            return NSOrderedDescending;
        }
        else
        {
            return NSOrderedAscending;
        }
        
    }];
    
    if (currentBeacons.count > 0)
    {
        CLBeacon *beacon = currentBeacons[0];
        
        
        if (([beacon.major integerValue] == 1) && ([beacon.minor integerValue] == 1))
        {
            
        }
        else if (([beacon.major integerValue] == 1) && ([beacon.minor integerValue] == 2))
        {
            if ((beacon.proximity == CLProximityImmediate))
            {
                if (!seatViewVisible)
                {
                    if (![archivedCoupons containsObject:@"seat"])
                    {
                        [self seatViewTapped:self];
                    }
                }
            }
        }
        else if (([beacon.major integerValue] == 1) && ([beacon.minor integerValue] == 3))
        {
            if ((beacon.proximity == CLProximityImmediate))
            {
                if (!couponViewVisible)
                {
                    if (![archivedCoupons containsObject:@"coupon"])
                    {
                        [self couponViewTapped:self];
                    }
                }
            }
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification == nil)
    {
        return;
    }
    
    // Notification details
    notification.alertBody = @"Did enter region";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification == nil)
    {
        return;
    }
    
    // Notification details
    notification.alertBody = @"Did exit region";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification == nil)
    {
        return;
    }
    
    // Notification details
    notification.alertBody = @"Region monitoring failed";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

#pragma mark - MKMapViewDelegate

- (MKTileOverlayRenderer *)mapView:(MKMapView*)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    return [[MKTileOverlayRenderer alloc] initWithOverlay:overlay];
}

#pragma mark - storyboards

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CategoryViewController *c = segue.destinationViewController;
    c.delegate = self;
}

#pragma mark - cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
