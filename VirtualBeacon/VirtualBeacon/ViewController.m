//
//  ViewController.m
//  VirtualBeacon
//
//  Created by Spencer Pieters on 28/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController ()

@property (nonatomic, retain) CLLocationManager *manager;
@property (nonatomic, retain) CBPeripheralManager *peripheralManager;
@property (nonatomic, retain) NSDictionary *options;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playBeaconTapped:(id)sender
{
    NSUUID *id = [[NSUUID alloc] initWithUUIDString:@"1CF83B1B-C8BC-4F2C-A18B-337E0FC6B33B"];
    NSString *majorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"majorid"];
    NSString *minorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"minorid"];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id major:[majorid integerValue] minor:[minorid integerValue] identifier:@"id1"];
    self.options = [region peripheralDataWithMeasuredPower:nil];
    
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue() options:self.options];
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    NSLog(@"State was updated");
    
    if (peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        NSLog(@"State was updated to powered on");
        
        [peripheral startAdvertising:self.options];
        
        NSString *majorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"majorid"];
        NSString *minorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"minorid"];
        
        self.labelInfo.text = [NSString stringWithFormat:@"Beacon met UUID 1CF83B1B-C8BC-4F2C-A18B-337E0FC6B33B, major %@, minor %@", majorid, minorid];
    }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(CBPeripheralManager *)peripheral
{
    NSLog(@"Is ready to update subscribers");
}

- (IBAction)searchBeaconsTapped:(id)sender
{
    NSUUID *id = [[NSUUID alloc] initWithUUIDString:@"1CF83B1B-C8BC-4F2C-A18B-337E0FC6B33B"];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id identifier:@"id1"];
    [self.manager startRangingBeaconsInRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    NSLog(@"Region %@ - %lu beacons gevonden", region.proximityUUID, (unsigned long)beacons.count);
    
    if (beacons.count > 0)
    {
        CLBeacon *beacon = beacons[0];
        
        NSString *distance = nil;
        if (beacon.proximity == CLProximityFar)
        {
            distance = [NSString stringWithFormat:@"Far, %f metres", beacon.accuracy];
        }
        else if (beacon.proximity == CLProximityImmediate)
        {
            distance = [NSString stringWithFormat:@"Immediate, %f metres", beacon.accuracy];
        }
        else if (beacon.proximity == CLProximityNear)
        {
            distance = [NSString stringWithFormat:@"Near, %f metres", beacon.accuracy];
        }
        else
        {
            distance = @"Unknown";
        }
        
        self.labelInfo.text = distance;
        
        NSLog(@"Beacon found with major id %ld and minor id %ld, proximity %@", (long)[beacon.major integerValue], (long)[beacon.minor integerValue], distance);
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"%@ %@", @"Beacon not found with error", error.localizedDescription);
}

@end
