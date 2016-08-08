//
//  UrlHelper.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "UrlHelper.h"

@implementation UrlHelper

#pragma mark - ---- LIFE CICLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

+ (NSString *) generateParamsFromDictionary:(NSDictionary *) params {
    NSMutableString *composedParams = [NSMutableString new];
    
    for (NSString *key in params.allKeys) {
        if (composedParams.length > 0) {
            [composedParams appendString:@"&"];
        }
        
        [composedParams appendFormat:@"%@=%@", key, params[key]];
    }
    
    return composedParams;
}

+ (NSString *) generateComposedUrlFromUrl:(NSString *) url withQueryParams:(NSDictionary *) params {
    NSMutableString *result = [NSMutableString stringWithString:url];
    
    if (params.allKeys.count == 0) {
        return result;
    }
    
    NSString *queryParams = [UrlHelper generateParamsFromDictionary:params];
    
    NSString *characterToAppend = @"?";
    if ([result rangeOfString:@"?"].location != NSNotFound) {
        characterToAppend = @"&";
        
    }
    
    [result appendFormat:@"%@%@", characterToAppend, queryParams];
    
    return result;
}

@end
