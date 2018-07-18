//
//  RSMapViewController.m
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSMapViewController.h"
#import <MapKit/MapKit.h>
#import "RSAnnotation.h"
#import "RSDescriptionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface RSMapViewController () <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *restMapView;

@end

@implementation RSMapViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.restMapView.showsUserLocation = YES;
    NSArray<RSRestaurant *> *arrayWithRestaurants = [NSArray arrayWithArray:[self.restaurantModel arrayWithRestaurants]];
    if(arrayWithRestaurants.count){
        NSUInteger indexShow = 0;
        double span = 1.0;
        for(NSUInteger index = 0; index < arrayWithRestaurants.count; index++){
            RSAnnotation *annotation = [RSAnnotation annotationWithRestaurant:arrayWithRestaurants[index]];
            [self.restMapView addAnnotation:annotation];
            if(self.restaurant != nil && self.restaurant.restaurantID == arrayWithRestaurants[index].restaurantID){
                [self.restMapView selectAnnotation:annotation
                                          animated:YES];
                indexShow = index;
                span = 0.01;
            }
        }
        [self showRestaurantOnMap:arrayWithRestaurants[indexShow]
                 withValueForSpan:span];
    }
}

-(void) showRestaurantOnMap:(RSRestaurant *)rest
           withValueForSpan:(double)value
{
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(rest.restaurantLocation.latitude,
                                                                                  rest.restaurantLocation.longitude),
                                                       MKCoordinateSpanMake(value, value));
    [self.restMapView setRegion:region
                       animated:YES];
}


#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == mapView.userLocation) {
        return nil;
    }
    MKAnnotationView *annotationView = [self.restMapView dequeueReusableAnnotationViewWithIdentifier:@"customAnnotationView"];
    if (annotationView == nil){
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"customAnnotationView"];
        annotationView.image = [UIImage imageNamed:@"PinMap_icon"];
        annotationView.canShowCallout = YES;
        UILabel *label = [UILabel new];
        label.text = annotation.subtitle;
        label.numberOfLines = 0;
        annotationView.detailCalloutAccessoryView = label;
        if(![annotation.title isEqualToString:self.restaurant.restaurantName]){
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        } else {
            [annotationView setSelected:YES
                               animated:YES];
        }
    }
    return annotationView;
}

-                (void)mapView:(MKMapView *)mapView
                annotationView:(MKAnnotationView *)view
 calloutAccessoryControlTapped:(UIControl *)control
{
    RSAnnotation *annotationTapped = (RSAnnotation *)view.annotation;
    RSDescriptionViewController *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSDescriptionViewController"];
    ctrl.restaurantModel = self.restaurantModel;
    ctrl.restaurant = [self.restaurantModel objectInArrayWithName:annotationTapped.title];
    
    [self.navigationController pushViewController:ctrl
                                         animated:YES];
}

@end
