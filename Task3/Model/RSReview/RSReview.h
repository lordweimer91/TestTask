//
//  RSReview.h
//  Task3
//
//  Created by user on 29.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface RSReview : JSONModel

@property (nonatomic, strong) NSString<Ignore> *key;
@property (nonatomic, assign) NSUInteger restaurantID;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString<Optional> *dateString;
@property (nonatomic, strong) NSString *text;

+(instancetype) reviewWithKey:(NSString *)key
                       author:(NSString *)author
                           id:(NSUInteger)identificator
                         text:(NSString *)text
                         date:(NSDate *)date;

+(instancetype) reviewWithKey:(NSString *)key
                       author:(NSString *)author
                           id:(NSUInteger)identificator
                         text:(NSString *)text
                   dateString:(NSString *)date;

@end
