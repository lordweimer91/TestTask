//
//  RSLocation.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSLocation.h"

@implementation RSLocation

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary: @{@"latitude": @"lat",
                                                                   @"longitude": @"lon"
                                                                  }];
}

-(BOOL) isEqual:(RSLocation *)location
{
    return ((self.latitude == location.latitude) &&
            (self.longitude == location.longitude));
}

@end
