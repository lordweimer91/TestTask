//
//  RSRestaurant.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSRestaurant.h"

@implementation RSRestaurant
-(instancetype)init
{
    if(self = [super init]){
        _restaurantLocation = [RSLocation new];
    }
    return self;
}

+(instancetype)restaurantWithID:(NSUInteger)identificator
                           name:(NSString *)name
                    description:(NSString *)description
                         rating:(float) rating
                       latitude:(float) latitude
                      longitude:(float) longitude
                        address:(NSString *)address
                       favorite:(BOOL)favorite
                     imagePaths:(NSArray<NSURL *> *)imagePaths
{
    RSRestaurant *restaurant = [RSRestaurant new];
    restaurant.restaurantID = identificator;
    restaurant.restaurantName = [NSString stringWithString:name];
    restaurant.restaurantDescription = [NSString stringWithString:description];
    restaurant.restaurantRating = rating;
    restaurant.restaurantLocation.latitude = latitude;
    restaurant.restaurantLocation.longitude = longitude;
    restaurant.restaurantAddress = [NSString stringWithString:address];
    restaurant.restaurantImagePath = [NSArray arrayWithArray:imagePaths];
    restaurant.restaurantFavorite = favorite;
    
    return restaurant;
}


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"restaurantID": @"id",
                                                                  @"restaurantName": @"name",
                                                                  @"restaurantDescription": @"description",
                                                                  @"restaurantAddress": @"address",
                                                                  @"restaurantRating": @"rating",
                                                                  @"restaurantLocation": @"location",
                                                                  @"restaurantImagePath": @"imagePaths"
                                                                  }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"restaurantFavorite"]){
        return YES;
    }
    return NO;
}

-(BOOL) isEqual:(RSRestaurant *)restaurant
{
    return ([self.restaurantName isEqualToString:restaurant.restaurantName] &&
            (self.restaurantID == restaurant.restaurantID) &&
            [self.restaurantAddress isEqualToString:restaurant.restaurantAddress] &&
            [self.restaurantLocation isEqual:restaurant.restaurantLocation] &&
            [self.restaurantDescription isEqualToString:restaurant.restaurantDescription] &&
            (self.restaurantRating == restaurant.restaurantRating) &&
            [self.restaurantImagePath isEqualToArray:restaurant.restaurantImagePath] &&
            (self.restaurantFavorite == restaurant.restaurantFavorite));
}
@end
