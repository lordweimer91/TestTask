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

+(void)addRestaurantArrayRealmObject:(RSRestaurant *)object //proverka git
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
        return [restRealm getRestaurant];
    }
    return nil;
}

+(NSArray<RSRestaurant *> *) getRestaurantArray
{
    NSMutableArray<RSRestaurant *> *array = [NSMutableArray new];
    RLMResults<RSRestaurantRealm *> *restResults = [RSRestaurantRealm allObjects];
    for(RSRestaurantRealm *restRealm in restResults){
        [array addObject:[restRealm getRestaurant]];
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
        [array addObject:[reviewRealm getReview]];
    }
    return [NSArray arrayWithArray:array];
}
@end
