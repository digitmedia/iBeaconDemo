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
    NSUUID *id = [[NSUUID alloc] initWithUUIDString:[[NSUserDefaults standardUserDefaults] stringForKey:@"uuid"]];
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
        
        NSString *uuid = [[NSUserDefaults standardUserDefaults] stringForKey:@"uuid"];
        NSString *majorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"majorid"];
        NSString *minorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"minorid"];
        
        self.labelInfo.text = [NSString stringWithFormat:@"Broadcasting as %@.%@", majorid, minorid];
    }
}

- (void)peripheralManagerIsReadyToUpdateSubscribers:(CBPeripheralManager *)peripheral
{
    NSLog(@"Is ready to update subscribers");
}

- (IBAction)searchBeaconsTapped:(id)sender
{
    NSUUID *id = [[NSUUID alloc] initWithUUIDString:[[NSUserDefaults standardUserDefaults] stringForKey:@"uuid"]];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:id identifier:@"id1"];
    [self.manager startRangingBeaconsInRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    if (beacons.count > 0)
    {
        currentBeacons = [beacons sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
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
        
        [self.tableViewBeacons reloadData];
    }
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error
{
    NSLog(@"%@ %@", @"Beacon not found with error", error.localizedDescription);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    if (currentBeacons.count > 0)
    {
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //NSInteger row = [indexPath row];
    CLBeacon *beacon = currentBeacons[0];
    
    NSString *distance = nil;
    if (beacon.proximity == CLProximityFar)
    {
        distance = [NSString stringWithFormat:@"Far, %1.2fm", beacon.accuracy];
    }
    else if (beacon.proximity == CLProximityImmediate)
    {
        distance = [NSString stringWithFormat:@"Immediate, %1.2fm", beacon.accuracy];
    }
    else if (beacon.proximity == CLProximityNear)
    {
        distance = [NSString stringWithFormat:@"Near, %1.2fm", beacon.accuracy];
    }
    else
    {
        distance = @"Unknown";
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%ld - %@ - %ld", (long)[beacon.major integerValue], (long)[beacon.minor integerValue], distance, (long)beacon.rssi];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
