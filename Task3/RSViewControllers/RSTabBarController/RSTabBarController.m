//
//  RSTabBarController.m
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSTabBarController.h"
#import "RSRestaurantViewController.h"
#import "RSMapViewController.h"
#import "RSFavoritesViewController.h"

@interface RSTabBarController ()

@end

@implementation RSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.restaurantModel = [RSModel new];
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
//                                                         bundle:nil];
    RSRestaurantViewController *tableCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSRestaurantViewController"];
    tableCtrl.restaurantModel = self.restaurantModel;
    tableCtrl.title = @"Restaurants";
    
    RSMapViewController *mapCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSMapViewController"];
    mapCtrl.restaurantModel = self.restaurantModel;
    mapCtrl.title = @"Map";
    
    RSFavoritesViewController *favCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSFavoritesViewController"];
    favCtrl.restaurantModel = self.restaurantModel;
    favCtrl.title = @"Favorites";
    
    UINavigationController *navMapCtrl = [[UINavigationController alloc] initWithRootViewController:mapCtrl];
    navMapCtrl.title = mapCtrl.title;
    
    UINavigationController *navFavCtrl = [[UINavigationController alloc] initWithRootViewController:favCtrl];
    navFavCtrl.title = favCtrl.title;
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:tableCtrl];
    navCtrl.title = tableCtrl.title;
    
    self.viewControllers = @[navCtrl,
                             navMapCtrl,
                             navFavCtrl];
}


@end
