//
//  RSReview.m
//  Task3
//
//  Created by user on 29.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSReview.h"

@interface RSReview()
@end

@implementation RSReview
+(instancetype) reviewWithKey:(NSString *)key
                       author:(NSString *)author
                           id:(NSUInteger)identificator
                         text:(NSString *)text
{
    RSReview *review = [RSReview new];
    review.restaurantID = identificator;
    review.text = [NSString stringWithString:text];
    review.author = [NSString stringWithString:author];
    review.key = [NSString stringWithString:key];
    return review;
}


+(instancetype) reviewWithKey:(NSString *)key
                       author:(NSString *)author
                           id:(NSUInteger)identificator
                         text:(NSString *)text
                         date:(NSDate *)date
{
    RSReview *review = [RSReview reviewWithKey:key
                                        author:author
                                            id:identificator
                                          text:text];
    NSDateFormatter *reviewDateFormatter = [NSDateFormatter new];
    reviewDateFormatter.dateFormat = @"yyyy-MM-dd'T'hh:MM:ssZZZZ";
    review.dateString = [reviewDateFormatter stringFromDate:date];
    return review;
}

+(instancetype) reviewWithKey:(NSString *)key
                       author:(NSString *)author
                           id:(NSUInteger)identificator
                         text:(NSString *)text
                   dateString:(NSString *)date
{
    RSReview *review = [RSReview reviewWithKey:key
                                        author:author
                                            id:identificator
                                          text:text];
    review.dateString = [NSString stringWithString:date];
    return review;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"restaurantID": @"restaurantId",
                                                                  @"author": @"author",
                                                                  @"dateString": @"date",
                                                                  @"text": @"reviewText"
                                                                  }];
}

@end
