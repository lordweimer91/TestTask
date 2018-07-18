//
//  RSAnnotationView.h
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface RSAnnotationView : MKAnnotationView
@property (strong, nonatomic) UIButton *buttonCustomeCallOut;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
@end
