//
//  RSReviewRealm.h
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RLMObject.h"
#import "RSReview.h"

@interface RSReviewRealm : RLMObject
@property (nonatomic, strong) NSString *key;
@property (nonatomic, assign) NSInteger restaurantID;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *text;

+(instancetype) reviewRealmWithReview:(RSReview *)review;
-(RSReview *) getReview;

@end
RLM_ARRAY_TYPE(RSReviewRealm) // define RLMArray<RSReviewRealm>
