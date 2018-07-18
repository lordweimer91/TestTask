//
//  RSFavoritesViewController.m
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSFavoritesViewController.h"
#import "RSFavoritesDataSource.h"
#import "RSDescriptionViewController.h"


@interface RSFavoritesViewController () <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *favoritesTableView;

@property (nonatomic, strong) RSFavoritesDataSource *dataSource;

@end

@implementation RSFavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [RSFavoritesDataSource new];
    self.dataSource.delegate = self;
    self.favoritesTableView.dataSource = self.dataSource;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self reloadDataSource];
}

-(void) reloadDataSource
{
    NSMutableArray<RSRestaurant *> *restaurantArray = [NSMutableArray arrayWithArray:[self.restaurantModel arrayWithRestaurants]];
    for(NSUInteger index = 0; index < restaurantArray.count; index++){
        if(restaurantArray[index].restaurantFavorite == NO){
            [restaurantArray removeObjectAtIndex:index];
            index--;
        }
    }
    [self.dataSource favoritesArrayWithArray:restaurantArray];
    [self.favoritesTableView reloadData];
}

#pragma mark - RSFavoritesTableViewCellDelegate

-(void) clickButtonOnFavoritesTableViewCell:(UITableViewCell *)cell
{
    [self.restaurantModel setFavoritesRestaurant:[self.dataSource restaurantAtIndexPath:[self.favoritesTableView indexPathForCell:cell]]
                                    withFavorite:NO];
    [self reloadDataSource];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSDescriptionViewController *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSDescriptionViewController"];
    ctrl.restaurantModel = self.restaurantModel;
    ctrl.restaurant = [self.dataSource restaurantAtIndexPath:indexPath];
    [self.navigationController pushViewController:ctrl
                                         animated:YES];
}

@end
