//
//  Currency.m
//  iMarket
//
//  Created by Ricardo Suarez on 10/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Currency.h"

@interface Currency ()

@property (nonatomic, copy) NSString *currencyName;
@property (nonatomic, copy) NSNumber *currencyValue;

@end

@implementation Currency

#pragma mark - ---- LIFE CYCLE

- (id) initWithName:(NSString *) name value:(NSNumber *) value
{
    self = [super init];
    if (self) {
        _currencyName = name;
        _currencyValue = value;
    }
    return self;
}

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- OVERRIDE

- (NSString *) name {
    return self.currencyName;
}

- (NSNumber *) value {
    return self.currencyValue;
}

#pragma mark - ---- PUBLIC

@end
