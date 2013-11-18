//
//  PushNoAnimationSegue.m
//  Ghelamco
//
//  Created by Spencer Pieters on 18/11/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void)perform
{
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
