//
//  ViewController.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSRestaurantViewController.h"
#import "RSDescriptionViewController.h"
#import "RSMapViewController.h"

@interface RSRestaurantViewController () <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *restaurantsTableView;
@property (nonatomic, strong) RSDataSource *dataSource;
@property (nonatomic, strong) RSRestaurant *restaurant;

@end

@implementation RSRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [RSDataSource new];
    self.restaurantsTableView.dataSource = self.dataSource;
    [self.dataSource arrayWithArray:[self.restaurantModel arrayWithRestaurants]];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self.restaurantModel getRestaurantsSuccess:^(NSArray<RSRestaurant *> *arrayWithRestaurants) {
        [self.dataSource arrayWithArray:arrayWithRestaurants];
        [self.restaurantsTableView reloadData];
    } failure:^(NSError *error) {
        [self showAlertWithError:error];
    }];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSDescriptionViewController *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSDescriptionViewController"];
    ctrl.restaurantModel = self.restaurantModel;
    ctrl.restaurant = [self.restaurantModel restaurantAtIndex:indexPath.row];
    [self.navigationController pushViewController:ctrl
                                         animated:YES];
   
}

@end
