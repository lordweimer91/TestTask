//
//  RSReviewRealm.m
//  Task3
//
//  Created by user on 16.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSReviewRealm.h"

@implementation RSReviewRealm
+ (NSString *)primaryKey {
    return @"key";
}

+(instancetype)reviewRealmWithReview:(RSReview *)review
{
    RSReviewRealm *restReview = [RSReviewRealm new];
    restReview.author = [NSString stringWithString:review.author];
    restReview.restaurantID = review.restaurantID;
    restReview.text = [NSString stringWithString:review.text];
    if(review.dateString == nil) {
        restReview.dateString = @"Date";
    } else {
        restReview.dateString = [NSString stringWithString:review.dateString];
    }
    restReview.key = [NSString stringWithString:review.key];
    return restReview;
}
@end
