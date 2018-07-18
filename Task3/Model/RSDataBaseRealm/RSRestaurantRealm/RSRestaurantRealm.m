//
//  RSRestaurantRealm.m
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSRestaurantRealm.h"

@implementation RSRestaurantRealm
+ (NSString *)primaryKey {
    return @"restaurantID";
}

+(instancetype)restaurantRealmWithRestaurant:(RSRestaurant *) restaurant
{
    RSRestaurantRealm *rest = [[RSRestaurantRealm alloc] init];
    rest.restaurantID = restaurant.restaurantID;
    rest.restaurantName = [NSString stringWithString:restaurant.restaurantName];
    rest.restaurantRating = restaurant.restaurantRating;
    rest.restaurantAddress = [NSString stringWithString:restaurant.restaurantAddress];
    rest.restaurantLatitude = restaurant.restaurantLocation.latitude;
    rest.restaurantLongitude = restaurant.restaurantLocation.longitude;
    rest.restaurantDescription = [NSString stringWithString:restaurant.restaurantDescription];
    for(NSUInteger i = 0; i < restaurant.restaurantImagePath.count; i++){
        RSStringRealm *str = [[RSStringRealm alloc] init];
        str.string = [NSString stringWithFormat:@"%@", restaurant.restaurantImagePath[i]];
        [rest.restaurantImagePath addObject:str];
    }
    rest.restaurantFavorite = restaurant.restaurantFavorite;
    return rest;
}
@end
