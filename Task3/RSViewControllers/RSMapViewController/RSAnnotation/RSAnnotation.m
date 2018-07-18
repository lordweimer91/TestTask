//
//  RSAnnotation.m
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSAnnotation.h"

@implementation RSAnnotation
+(instancetype)annotationWithRestaurant:(RSRestaurant *)restaurant
{
    RSAnnotation *annotation = [RSAnnotation new];
    annotation.title = [NSString stringWithString:restaurant.restaurantName];
    annotation.subtitle = [NSString stringWithString:restaurant.restaurantDescription];
    annotation.coordinate = CLLocationCoordinate2DMake(restaurant.restaurantLocation.latitude,
                                                       restaurant.restaurantLocation.longitude);
    return annotation;
}
@end
