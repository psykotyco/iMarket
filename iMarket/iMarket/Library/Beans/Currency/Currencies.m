//
//  Currencies.m
//  iMarket
//
//  Created by Ricardo Suarez on 10/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Currencies.h"

#import "Constants.h"
#import "Currency.h"


@implementation Currencies

#pragma mark - ---- LIFE CYCLE

- (id) initWithDictionary:(NSDictionary *) data {
    self = [super init];
    if (self) {
        [self generateCurrencyItemsFromDictionary:data];
    }
    return self;
}

#pragma mark - ---- INTERNAL

- (void) generateCurrencyItemsFromDictionary:(NSDictionary *) data {
    NSMutableArray *result = [NSMutableArray new];
    NSDictionary *currencies = [data objectForKey:kCurrencyListValues_Key];
    NSString *currencySource = [data objectForKey:kCurrencySource_Key];
    
    for (NSString *key in currencies.allKeys) {
        NSString *currencyName = [key stringByReplacingOccurrencesOfString:currencySource withString:@""];
        NSNumber *currencyValue = [currencies objectForKey:key];
        Currency *currency = [[Currency alloc] initWithName:currencyName value:currencyValue];
        [result addObject:currency];
    }
    
    _currencies = [NSArray arrayWithArray:result];
}

#pragma mark - ---- PUBLIC

@end
