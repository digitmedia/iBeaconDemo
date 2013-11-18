//
//  LocalMacroTileOverlay.m
//  Ghelamco
//
//  Created by Spencer Pieters on 18/11/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "LocalMacroTileOverlay.h"

@implementation LocalMacroTileOverlay

- (NSURL*)URLForTilePath:(MKTileOverlayPath)path
{
    NSString *bundlepath = [[NSBundle mainBundle] pathForResource:@"MacroTiles" ofType:@""];
    NSString *finalpath = [bundlepath stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld/%ld/%ld.png", (long)path.z, (long)path.x, (long)path.y]];
    
    return [NSURL fileURLWithPath:finalpath];
}

@end
