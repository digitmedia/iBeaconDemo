//
//  CategoryPickerDelegate.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CategoryPickerDelegate <NSObject>

- (void)categoryDidReceiveTap:(NSInteger)type;

@end
