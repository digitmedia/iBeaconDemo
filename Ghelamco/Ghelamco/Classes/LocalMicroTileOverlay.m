//
//  LocalTileOverlay.m
//  GoOffline
//
//  Created by Spencer Pieters on 13/09/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "LocalMicroTileOverlay.h"

@implementation LocalMicroTileOverlay

- (NSURL*)URLForTilePath:(MKTileOverlayPath)path
{
    NSString *bundlepath = [[NSBundle mainBundle] pathForResource:@"MicroTiles" ofType:@""];
    NSString *finalpath = [bundlepath stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld/%ld/%ld.png", (long)path.z, (long)path.x, (long)path.y]];
    
    return [NSURL fileURLWithPath:finalpath];
}

@end
