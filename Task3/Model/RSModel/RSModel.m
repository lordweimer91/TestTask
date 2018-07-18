//
//  RSModel.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSModel.h"
#import "AFNetworking.h"
#import "JSONModel+networking.h"
#import "RSDataBaseRealm.h"

static NSString const *baseAddressURL = @"https://restaurants-f64d7.firebaseio.com/";
static NSString const *restaurantsAddressURL = @"restaurants.json";
static NSString const *reviewAddressURL = @"reviews.json";
static NSString const *reviewIdAddressURL = @"?orderBy=\"restaurantId\"&equalTo=";

@interface RSModel()
@property (nonatomic, strong) NSMutableArray<RSRestaurant *> *restaurantArray;
@property (nonatomic, strong) AFURLSessionManager *urlSessionManager;
@property (nonatomic, strong) NSMutableArray<RSReview *> *restaurantReviewArray;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *favoritesIDArray;

@end

@implementation RSModel
-(instancetype)init
{
    if(self = [super init]){
        _restaurantArray = [NSMutableArray arrayWithArray:[RSDataBaseRealm getRestaurantArray]];
        _urlSessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        _restaurantReviewArray = [NSMutableArray new];
    }
    return self;
}

-(RSRestaurant *)objectAtIndex:(NSUInteger)index
{
    if(index < self.restaurantArray.count) {
        return self.restaurantArray[index];
    }
    return nil;
}

-(void) setFavoritesRestaurantAtIndex:(NSUInteger)index
                         withFavorite:(BOOL)favorite
{
    if(index < self.restaurantArray.count){
        self.restaurantArray[index].restaurantFavorite = favorite;
        [RSDataBaseRealm addRestaurantArrayRealmObject:self.restaurantArray[index]];
    }
}

-(void) setFavoritesRestaurant:(RSRestaurant *)rest
                  withFavorite:(BOOL)favorite
{
    [self setFavoritesRestaurantAtIndex:[self indexOfObject:rest]
                           withFavorite:favorite];
}

-(NSArray<RSRestaurant *> *) arrayWithRestaurants
{
    return [NSArray arrayWithArray:self.restaurantArray];
}

-(NSUInteger) indexOfObject:(RSRestaurant *)object
{
    return [self.restaurantArray indexOfObject:object];
}

-(RSRestaurant *) objectInArrayWithName:(NSString *)name
{
    for(RSRestaurant *restaurant in self.restaurantArray){
        if([name isEqualToString:restaurant.restaurantName]){
            return restaurant;
        }
    }
    return nil;
}

- (void) getRestaurantsSuccess:(void(^)(NSArray<RSRestaurant *> *arrayWithRestaurants))success
                       failure:(void(^)(NSError *error))failure
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseAddressURL,restaurantsAddressURL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.urlSessionManager dataTaskWithRequest:request
                                                                  uploadProgress:nil
                                                                downloadProgress:nil
                                                               completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        if(error) {
            failure(error);
            return;
        }
        if(responseObject){
            if([responseObject isKindOfClass:[NSArray class]]){
                [self.restaurantArray removeAllObjects];
                for(NSUInteger i = 0; i < [responseObject count]; i++) {
                    NSDictionary *result = responseObject[i];
                    RSRestaurant *rest = [[RSRestaurant alloc] initWithDictionary:result
                                                                            error:&error];
                    rest.restaurantFavorite = [RSDataBaseRealm getRestaurantWithID:rest.restaurantID].restaurantFavorite;
                    [self.restaurantArray addObject:rest];
                    [RSDataBaseRealm addRestaurantArrayRealmObject:rest];
                    if(error) {
                        failure(error);
                        return;
                    }
                }
                success([NSArray arrayWithArray:self.restaurantArray]);
            }
        }
    }];
    [dataTask resume];
}

-(void) getReviewRestaurantAtIndex:(NSUInteger)index
                                success:(void(^)(NSArray<RSReview *> *arrayWithRestaurantsReview))success
                                failure:(void(^)(NSError *error))failure
{
    if(index < self.restaurantArray.count) {
        [self.restaurantReviewArray removeAllObjects];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%li",
                                           baseAddressURL,
                                           reviewAddressURL,
                                           [reviewIdAddressURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]],
                                           self.restaurantArray[index].restaurantID]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLSessionDataTask *dataTask = [self.urlSessionManager dataTaskWithRequest:request
                                                                      uploadProgress:nil
                                                                    downloadProgress:nil
                                                                   completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
               if(error){
                   failure(error);
                   return;
               }
               if(responseObject){
                   if([responseObject isKindOfClass:[NSDictionary class]]){
                       NSArray<NSString *> *keys = [responseObject allKeys];
                       for(NSString *key in keys) {
                           NSDictionary *dict = responseObject[key];
                           RSReview *newReview = [[RSReview alloc] initWithDictionary:dict
                                                                                error:&error];
                           newReview.key = key;
                           if(error){
                               failure(error);
                               return;
                           }
                           [self.restaurantReviewArray addObject:newReview];
                           [RSDataBaseRealm addReviewArrayRealmObject:newReview];
                       }
                       success([NSArray arrayWithArray:self.restaurantReviewArray]);
                   }
               }
           }];
        [dataTask resume];
    }
}

-(NSArray<RSReview *> *) getReviewRestaurant:(RSRestaurant *)restaurant
                                     success:(void(^)(NSArray<RSReview *> *arrayWithRestaurantsReview))success
                                     failure:(void(^)(NSError *error))failure
{
    [self getReviewRestaurantAtIndex:[self.restaurantArray indexOfObject:restaurant]
                             success:success
                             failure:failure];
    return [NSArray arrayWithArray:[RSDataBaseRealm getResaturantReviewsWithID:restaurant.restaurantID]];
}

-(void) postNewReview:(RSReview *)review
    completionHandler:(void (^)(id responseObject,  NSError * error))completionHandler
{
    NSError *error = nil;
    NSString *jsonString = [review toJSONString];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", baseAddressURL, reviewAddressURL];
    NSMutableURLRequest *urlRequest = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                                    URLString:urlString
                                                                                   parameters:nil
                                                                                        error:&error];
    if(error){
        completionHandler(nil, error);
        return;
    }
    [urlRequest setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionDataTask *dataTask = [self.urlSessionManager dataTaskWithRequest:urlRequest
                                                                  uploadProgress:nil
                                                                downloadProgress:nil
                                                               completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                                   completionHandler(responseObject, error);
                                                               }];
    [dataTask resume];
}

@end
