//
//  RSRestaurantRealm.h
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Realm/Realm.h>
#import "RSStringRealm.h"
#import "RSRestaurant.h"

@interface RSRestaurantRealm : RLMObject

@property (nonatomic, assign) NSInteger restaurantID;
@property (nonatomic, strong) NSString *restaurantName;
@property (nonatomic, strong) NSString *restaurantDescription;
@property (nonatomic, assign) float restaurantRating;
@property (nonatomic, assign) float restaurantLatitude;
@property (nonatomic, assign) float restaurantLongitude;
@property (nonatomic, strong) NSString *restaurantAddress;
@property (nonatomic, strong) RLMArray<RSStringRealm *><RSStringRealm> *restaurantImagePath;
@property (nonatomic, assign) BOOL restaurantFavorite;

+(instancetype) restaurantRealmWithRestaurant:(RSRestaurant *) restaurant;
-(RSRestaurant *) getRestaurant;

@end

RLM_ARRAY_TYPE(RSRestaurantRealm) // define RLMArray<RSRestaurantRealm>
