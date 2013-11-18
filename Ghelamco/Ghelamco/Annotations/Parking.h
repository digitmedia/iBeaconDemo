//
//  Parking.h
//  Ghelamco
//
//  Created by Spencer Pieters on 18/11/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Parking : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
