//
//  RSRestaurant.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "RSLocation.h"
#import "RLMObject.h"

@interface RSRestaurant : JSONModel

@property (nonatomic, assign) NSUInteger restaurantID;
@property (nonatomic, strong) NSString *restaurantName;
@property (nonatomic, strong) NSString *restaurantDescription;
@property (nonatomic, assign) float restaurantRating;
@property (nonatomic, strong) NSArray<NSURL *> *restaurantImagePath;
@property (nonatomic, strong) RSLocation *restaurantLocation;
@property (nonatomic, strong) NSString *restaurantAddress;
@property (nonatomic, assign) BOOL restaurantFavorite;

+(instancetype)restaurantWithID:(NSUInteger)identificator
                           name:(NSString *)name
                    description:(NSString *)description
                         rating:(float) rating
                       latitude:(float) latitude
                      longitude:(float) longitude
                        address:(NSString *)address
                       favorite:(BOOL)favorite
                     imagePaths:(NSArray<NSURL *> *)imagePaths;

@end
