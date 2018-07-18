//
//  RSLocation.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface RSLocation : JSONModel
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;

@end
