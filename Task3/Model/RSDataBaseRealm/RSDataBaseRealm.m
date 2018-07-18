//
//  RSDataBaseRealm.m
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSDataBaseRealm.h"

@interface RSDataBaseRealm()
@end

@implementation RSDataBaseRealm

+(void)addRestaurantArrayRealmObject:(RSRestaurant *)object
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:[RSRestaurantRealm restaurantRealmWithRestaurant:object]];
    [realm commitWriteTransaction];
}

+(RSRestaurant *) getRestaurantWithID:(NSInteger) restID
{
    RLMResults<RSRestaurantRealm *> *result = [RSRestaurantRealm objectsWhere:@"restaurantID == %i", restID];
    RSRestaurantRealm *restRealm = result.lastObject;
    if(restRealm){
        NSMutableArray<NSURL *> *urls = [NSMutableArray new];
        for(NSUInteger i = 0; i < restRealm.restaurantImagePath.count; i++){
            [urls addObject:[NSURL URLWithString:restRealm.restaurantImagePath[i].string]];
        }
        RSRestaurant *rest = [RSRestaurant restaurantWithID:restRealm.restaurantID
                                                       name:restRealm.restaurantName
                                                description:restRealm.restaurantDescription
                                                     rating:restRealm.restaurantRating
                                                   latitude:restRealm.restaurantLatitude
                                                  longitude:restRealm.restaurantLongitude
                                                    address:restRealm.restaurantAddress
                                                   favorite:restRealm.restaurantFavorite
                                                 imagePaths:urls];
        return rest;
    }
    return nil;
}

+(NSArray<RSRestaurant *> *) getRestaurantArray
{
    NSMutableArray<RSRestaurant *> *array = [NSMutableArray new];
    RLMResults<RSRestaurantRealm *> *restResults = [RSRestaurantRealm allObjects];
    for(RSRestaurantRealm *restRealm in restResults){
        NSMutableArray<NSURL *> *urls = [NSMutableArray new];
        for(NSUInteger i = 0; i < restRealm.restaurantImagePath.count; i++){
            [urls addObject:[NSURL URLWithString:restRealm.restaurantImagePath[i].string]];
        }
        RSRestaurant *rest = [RSRestaurant restaurantWithID:restRealm.restaurantID
                                                       name:restRealm.restaurantName
                                                description:restRealm.restaurantDescription
                                                     rating:restRealm.restaurantRating
                                                   latitude:restRealm.restaurantLatitude
                                                  longitude:restRealm.restaurantLongitude
                                                    address:restRealm.restaurantAddress
                                                   favorite:restRealm.restaurantFavorite
                                                 imagePaths:urls];
        [array addObject:rest];
    }
    return [NSArray arrayWithArray:array];
}

+(void)addReviewArrayRealmObject:(RSReview *)object
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:[RSReviewRealm reviewRealmWithReview:object]];
    [realm commitWriteTransaction];
}

+(NSArray<RSReview *> *) getResaturantReviewsWithID:(NSInteger)restID
{
    NSMutableArray<RSReview *> *array = [NSMutableArray new];
    RLMResults<RSReviewRealm *> *restReviewResults = [RSReviewRealm objectsWhere:@"restaurantID == %i", restID];
    for(RSReviewRealm *reviewRealm in restReviewResults){
        RSReview *review = [RSReview reviewWithKey:reviewRealm.key
                                            author:reviewRealm.author
                                                id:reviewRealm.restaurantID
                                              text:reviewRealm.text
                                        dateString:reviewRealm.dateString];
        [array addObject:review];
    }
    return [NSArray arrayWithArray:array];
}
@end
