//
//  ConnectionManager.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionManager : NSObject

- (void) launchUrl:(NSString *) url withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion;
- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion;
- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers queryParams:(NSDictionary *) queryParams withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion;
- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers queryParams:(NSDictionary *) queryParams bodyParams:(NSData *) bodyParams withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion;

- (void) launchUrlRequest:(NSURLRequest *) urlRequest withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion;

@end
