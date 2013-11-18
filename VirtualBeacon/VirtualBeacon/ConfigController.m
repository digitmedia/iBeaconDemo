//
//  ConfigController.m
//  VirtualBeacon
//
//  Created by Spencer Pieters on 28/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "ConfigController.h"

@interface ConfigController ()

@end

@implementation ConfigController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *uuid = [[NSUserDefaults standardUserDefaults] stringForKey:@"uuid"];
    NSString *majorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"majorid"];
    NSString *minorid = [[NSUserDefaults standardUserDefaults] stringForKey:@"minorid"];
    
    self.labelUUID.text = uuid;
    self.labelMajor.text = majorid;
    self.labelMinor.text = minorid;
}

#pragma mark - actions

-(void) viewWillDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound)
    {
        NSString *uuid = self.labelUUID.text;
        NSString *majorid = self.labelMajor.text;
        NSString *minorid = self.labelMinor.text;
        
        [[NSUserDefaults standardUserDefaults] setValue:uuid forKey:@"uuid"];
        [[NSUserDefaults standardUserDefaults] setValue:majorid forKey:@"majorid"];
        [[NSUserDefaults standardUserDefaults] setValue:minorid forKey:@"minorid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
