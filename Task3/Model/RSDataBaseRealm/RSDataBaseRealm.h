//
//  RSDataBaseRealm.h
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/Realm.h>
#import "RSRestaurantRealm.h"
#import "RSReviewRealm.h"
#import "RSRestaurant.h"
#import "RSReview.h"

@interface RSDataBaseRealm : RLMObject

+(void)addRestaurantArrayRealmObject:(RSRestaurant *)object;
+(NSArray<RSRestaurant *> *) getRestaurantArray;
+(RSRestaurant *) getRestaurantWithID:(NSInteger)restID;

+(void)addReviewArrayRealmObject:(RSReview *)object;
+(NSArray<RSReview *> *) getResaturantReviewsWithID:(NSInteger)restID;

@end
