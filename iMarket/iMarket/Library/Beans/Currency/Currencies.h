//
//  Currencies.h
//  iMarket
//
//  Created by Ricardo Suarez on 10/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currencies : NSObject

@property (nonatomic, strong) NSArray *currencies;

- (id) initWithDictionary:(NSDictionary *) data;

@end
