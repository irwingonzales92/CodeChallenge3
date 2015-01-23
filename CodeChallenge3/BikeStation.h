//
//  BikeStation.h
//  CodeChallenge3
//
//  Created by Irwin Gonzales on 1/23/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BikeStation : NSObject

@property NSString *id;
@property NSString *stationName;
@property NSString *avalibleDocks;
@property NSString *totalDocks;
@property NSNumber *latitude;
@property NSNumber *longitude;
@property NSString *statusValue;
@property NSString *statusKey;
@property NSNumber *avalibleBikes;
@property NSString *stAddress1;
@property NSString *stAddress2;
@property NSString *city;
@property NSString *postalCode;
@property NSString *location;
@property NSString *altitude;
@property NSString *testStation;
@property NSString *lastCommunicationTime;
@property NSString *landMark;

@end
