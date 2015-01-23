//
//  MapViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "StationsListViewController.h"
#import "BikeStation.h"

@interface MapViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self pinBikeStations];
    
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(37.33182, -122.03118);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.title = @"San Jose Diridon Caltrain Station";
    annotation.coordinate = CLLocationCoordinate2DMake(37.329732,-121.901782);
    [self.mapView addAnnotation:annotation];

    
}
//
//-(void)pinBikeStations
//{
//    for (BikeStation *bikeStation in self.rowArray)
//    {
//        CLLocationDegrees longitude;
//        
//        if ([bikeStation.longitude doubleValue] < 0)
//        {
//            longitude = [bikeStation.longitude doubleValue];
//        }
//        else
//        {
//            longitude = -[bikeStation.latitude doubleValue];
//        }
//        
//        CLLocationDegrees latitude = [bikeStation.latitude doubleValue];
//        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
//        
//        MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
//        annotation.title = bikeStation.stAddress1;
//        annotation.coordinate = coordinate;
//        
//
//    }
//}

@end
