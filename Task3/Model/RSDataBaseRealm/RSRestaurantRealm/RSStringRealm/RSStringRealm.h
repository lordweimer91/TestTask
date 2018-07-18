//
//  RSStringRealm.h
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RLMObject.h"

@interface RSStringRealm : RLMObject
@property (nonatomic, strong) NSString *string;
@end
RLM_ARRAY_TYPE(RSStringRealm) // define RLMArray<RSRestaurantRealm>

