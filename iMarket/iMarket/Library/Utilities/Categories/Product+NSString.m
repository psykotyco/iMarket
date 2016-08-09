//
//  Product+NSString.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Product+NSString.h"

#import "Constants.h"

@implementation Product (NSString)

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

- (NSString *) getFormattedStringPriceByPackage {
    NSString *packageConjunction = NSLocalizedString(Product_Package_Conjunction_Localizable_Key, nil);
    return [NSString stringWithFormat:@"$%.2f %@ %@", self.price, packageConjunction, self.package];
}

@end
