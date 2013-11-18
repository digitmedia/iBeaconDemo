//
//  MacroViewController.m
//  Ghelamco
//
//  Created by Spencer Pieters on 18/11/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#import "MacroViewController.h"
#import "LocalMacroTileOverlay.h"
#import "Parking.h"

@interface MacroViewController ()

@end

@implementation MacroViewController

#pragma mark - initialisation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(51.016104,3.733828), MKCoordinateSpanMake(0.003, 0.003));
    self.mapViewMain.region = region;
    
    LocalMacroTileOverlay *tileOverlay = [[LocalMacroTileOverlay alloc] initWithURLTemplate:@""];
    
    tileOverlay.canReplaceMapContent = NO;
    tileOverlay.minimumZ = 13;
    tileOverlay.maximumZ = 18;
    [_mapViewMain addOverlay:tileOverlay];
    
    UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapMap:)];
    [self.mapViewMain addGestureRecognizer:r];
    
    [self addParkingsToMap];
}

#pragma mark - actions

- (void)addParkingsToMap
{
    Parking *parkingA = [[Parking alloc] init];
    parkingA.title = @"Parking A";
    parkingA.coordinate = CLLocationCoordinate2DMake(51.015031, 3.731941);
    
    Parking *parkingB = [[Parking alloc] init];
    parkingB.title = @"Parking B";
    parkingB.coordinate = CLLocationCoordinate2DMake(51.014268, 3.735648);
    
    Parking *parkingC = [[Parking alloc] init];
    parkingC.title = @"Parking C";
    parkingC.coordinate = CLLocationCoordinate2DMake(51.014250, 3.736307);
    
    Parking *parkingG = [[Parking alloc] init];
    parkingG.title = @"Parking G";
    parkingG.coordinate = CLLocationCoordinate2DMake(51.017106, 3.737497);
    
    Parking *parkingH = [[Parking alloc] init];
    parkingH.title = @"Parking H";
    parkingH.coordinate = CLLocationCoordinate2DMake(51.017930, 3.736527);
    
    Parking *parkingJ = [[Parking alloc] init];
    parkingJ.title = @"parking J";
    parkingJ.coordinate = CLLocationCoordinate2DMake(51.017917, 3.734257);
    
    Parking *parkingI = [[Parking alloc] init];
    parkingI.title = @"parking I";
    parkingI.coordinate = CLLocationCoordinate2DMake(51.018656, 3.736973);
    
    Parking *parkingK = [[Parking alloc] init];
    parkingK.title = @"parking K";
    parkingK.coordinate = CLLocationCoordinate2DMake(51.018839, 3.739302);
    
    Parking *parkingL = [[Parking alloc] init];
    parkingL.title = @"parking L";
    parkingL.coordinate = CLLocationCoordinate2DMake(51.019639, 3.735033);
    
    Parking *parkingO = [[Parking alloc] init];
    parkingO.title = @"parking O";
    parkingO.coordinate = CLLocationCoordinate2DMake(51.022763, 3.730432);
    
    [self.mapViewMain addAnnotation:parkingA];
    [self.mapViewMain addAnnotation:parkingB];
    [self.mapViewMain addAnnotation:parkingC];
    [self.mapViewMain addAnnotation:parkingG];
    [self.mapViewMain addAnnotation:parkingH];
    [self.mapViewMain addAnnotation:parkingJ];
    [self.mapViewMain addAnnotation:parkingI];
    [self.mapViewMain addAnnotation:parkingK];
    [self.mapViewMain addAnnotation:parkingL];
    [self.mapViewMain addAnnotation:parkingO];
}

- (void)didTapMap:(UIGestureRecognizer*)recognizer
{
    CGPoint location = [recognizer locationInView:_mapViewMain];
    
    CLLocationCoordinate2D coordinate = [_mapViewMain convertPoint:location toCoordinateFromView:_mapViewMain];
    
    NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
    
    // A
    // 51.015031, 3.731941
    
    // B
    // 51.014268, 3.735648
    
    // C
    // 51.014250, 3.736307
    
    // G
    // 51.017106, 3.737497
    
    // H
    // 51.017930, 3.736527
    
    // J
    // 51.017917, 3.734257
    
    // I
    // 51.018656, 3.736973
    
    // K
    // 51.018839, 3.739302
    
    // L
    // 51.019639, 3.735033
    
    // O
    // 51.022763, 3.730432
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    currentLocation = userLocation.coordinate;
}

- (MKAnnotationView*)mapView:(MKMapView *)map viewForAnnotation:(id<MKAnnotation>)annotation
{
	NSString *identifier = @"parking";
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[map dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

- (MKOverlayRenderer *)mapView:(MKMapView*)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKTileOverlay class]])
    {
        return [[MKTileOverlayRenderer alloc] initWithOverlay:overlay];
    }
    else if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        renderer.strokeColor = [UIColor redColor];
        renderer.fillColor = [UIColor redColor];
        renderer.lineWidth = 4;
        
        return renderer;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSMutableArray *overlaysToBeRemoved = [NSMutableArray arrayWithCapacity:0];
    
    for (MKOverlayView *overlay in self.mapViewMain.overlays)
    {
        if ([overlay isKindOfClass:[MKPolyline class]])
        {
            [overlaysToBeRemoved addObject:overlay];
        }
    }
    
    [self.mapViewMain removeOverlays:overlaysToBeRemoved];
    
    Parking *parking = (Parking*)[view annotation];
    
    MKPlacemark *beginMark = [[MKPlacemark alloc] initWithCoordinate:currentLocation addressDictionary:nil];
    MKPlacemark *eindeMark = [[MKPlacemark alloc] initWithCoordinate:parking.coordinate addressDictionary:nil];
    
    MKMapItem *begin = [[MKMapItem alloc] initWithPlacemark:beginMark];
    MKMapItem *einde = [[MKMapItem alloc] initWithPlacemark:eindeMark];
    
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    directionsRequest.source = begin;
    directionsRequest.destination = einde;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler: ^void (MKDirectionsResponse *response, NSError *error)
     {
         NSLog(@"%@", @"Toegekomen in response block");
         
         if (response.routes.count > 0)
         {
             MKRoute *route = response.routes[0];
             MKPolyline *polyline = route.polyline;
             [_mapViewMain addOverlay:polyline];
             
             for (MKRouteStep *step in route.steps)
             {
                 NSLog(@"%@", step.instructions);
             }
         }
     }];
}

#pragma mark - cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
