//
//  StyleSheet.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "StyleSheet.h"

static CGFloat const kMainColor_Red = 143.0f;
static CGFloat const kMainColor_Green = 202.0f;
static CGFloat const kMainColor_Blue = 205.0f;

static CGFloat const kSecondaryColor_Red = 249.0f;
static CGFloat const kSecondaryColor_Green = 87.0f;
static CGFloat const kSecondaryColor_Blue = 65.0f;

@implementation StyleSheet

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

+ (UIColor *) getMainColor {
    return [UIColor colorWithRed:(kMainColor_Red/255.0f) green:(kMainColor_Green/255.0f) blue:(kMainColor_Blue/255.0f) alpha:1.0f];
}

+ (UIColor *) getSecondaryColor {
    return [UIColor colorWithRed:(kSecondaryColor_Red/255.0f) green:(kSecondaryColor_Green/255.0f) blue:(kSecondaryColor_Blue/255.0f) alpha:1.0f];
}

@end
