//
//  RSModel.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSRestaurant.h"
#import "RSReview.h"

@interface RSModel : NSObject

-(RSRestaurant *) restaurantAtIndex:(NSUInteger)index;
-(RSRestaurant *) restaurantInArrayWithName:(NSString *)name;

-(void) setFavoritesRestaurant:(RSRestaurant *)rest
                  withFavorite:(BOOL)favorite;

-(void) setFavoritesRestaurantAtIndex:(NSUInteger)index
                         withFavorite:(BOOL)favorite;

-(NSUInteger) indexOfRestaurant:(RSRestaurant *)object;

-(NSArray<RSRestaurant *> *) arrayWithRestaurants;

- (void) getRestaurantsSuccess:(void(^)(NSArray<RSRestaurant *> *arrayWithRestaurantsReview))success
                       failure:(void(^)(NSError *error))failure;

-(void) getReviewRestaurantAtIndex:(NSUInteger)index
                           success:(void(^)(NSArray<RSReview *> *arrayWithRestaurantsReview))success
                           failure:(void(^)(NSError *error))failure;

-(NSArray<RSReview *> *) getReviewRestaurant:(RSRestaurant *)restaurant
                                     success:(void(^)(NSArray<RSReview *> *arrayWithRestaurantsReview))success
                                     failure:(void(^)(NSError *error))failure;

-(void) postNewReview:(RSReview *)review
    completionHandler:(void (^)(id responseObject,  NSError * error))completionHandler;

@end
