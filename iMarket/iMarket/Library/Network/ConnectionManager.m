//
//  ConnectionManager.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ConnectionManager.h"

#import "UrlHelper.h"

@interface ConnectionManager ()

@end

@implementation ConnectionManager

#pragma mark - ---- LIFE CICLE

- (void) launchUrl:(NSString *) url withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion  {
    [self launchUrl:url withHeaders:nil withCompletionBlock:completion];
}

- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers withCompletionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completion {
    [self launchUrl:url withHeaders:headers queryParams:nil withCompletionBlock:completion];
}

- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers queryParams:(NSDictionary *) queryParams withCompletionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completion {
    [self launchUrl:url withHeaders:headers queryParams:queryParams bodyParams:nil withCompletionBlock:completion];
}

- (void) launchUrl:(NSString *) url withHeaders:(NSDictionary *) headers queryParams:(NSDictionary *) queryParams bodyParams:(NSData *) bodyParams withCompletionBlock:(void (^)(NSData *, NSURLResponse *, NSError *))completion {
    NSString *composedUrl = [UrlHelper generateComposedUrlFromUrl:url withQueryParams:queryParams];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:composedUrl]];
    
    for (NSString *header in headers.allKeys) {
        [request setValue:headers[header] forHTTPHeaderField:header];
    }
    
    if (bodyParams.length > 0) {
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:bodyParams];
    } else {
        [request setHTTPMethod:@"GET"];
    }
    
    [self launchUrlRequest:request withCompletionBlock:completion];
}

#pragma mark - ---- INTERNAL

- (void) launchUrlRequest:(NSURLRequest *) urlRequest withCompletionBlock:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completion {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(data, response, error);
        });
    }] resume];
}

#pragma mark - ---- PUBLIC


@end
