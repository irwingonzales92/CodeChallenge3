//
//  StationsListViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "StationsListViewController.h"
#import "BikeStation.h"
#import "MapViewController.h"
#import "BikeStationAnnotation.h"

@interface StationsListViewController () <UITabBarDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSMutableArray *rowArray;


@end

@implementation StationsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rowArray = [NSMutableArray new];
    [self parseBikeInfo];
}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO:
    return self.rowArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    // TODO:
    
    BikeStation *bikeStop = [self.rowArray objectAtIndex:indexPath.row];
    cell.textLabel.text = bikeStop.stAddress1;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",bikeStop.avalibleBikes];
    
    return cell;
}

-(void)parseBikeInfo
{
    NSURL *url = [NSURL URLWithString:@"http://www.bayareabikeshare.com/stations/json"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSDictionary *bikeStationDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *jsonArray = [bikeStationDictionary objectForKey:@"stationBeanList"];
        
        for (NSDictionary *bikeStopDict in jsonArray)
        {
            BikeStation *currentStation = [BikeStation new];
            [self.rowArray addObject:currentStation];
            
            currentStation.longitude = [bikeStopDict objectForKey:@"longitude"];
            currentStation.latitude = [bikeStopDict objectForKey:@"latitude"];
            
            currentStation.stAddress1 = [bikeStopDict objectForKey:@"stAddress1"];
            currentStation.avalibleBikes = [bikeStopDict objectForKey:@"availableBikes"];
        }
        [self.tableView reloadData];
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *vc = [segue destinationViewController];
    vc.rowArray = sender;
}




@end
