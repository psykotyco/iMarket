//
//  DataManager.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (id) sharedInstance;

- (instancetype) init __attribute__((unavailable("init not available")));

- (NSArray *) getProducts;

@end
