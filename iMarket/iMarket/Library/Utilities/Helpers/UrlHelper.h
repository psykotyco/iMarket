//
//  UrlHelper.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlHelper : NSObject

+ (NSString *) generateParamsFromDictionary:(NSDictionary *) params;
+ (NSString *) generateComposedUrlFromUrl:(NSString *) url withQueryParams:(NSDictionary *) params;

@end
