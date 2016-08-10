//
//  UIView+Utilities.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "UIView+Utilities.h"

@implementation UIView (Utilities)

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

- (void) addFullSizeSubview:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    self.layoutMargins = UIEdgeInsetsMake(0,0,0,0);
    [self addSubview:view];
    
    NSDictionary *viewsDictionary = @{@"childView":view};
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[childView]-|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[childView]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewsDictionary];
    
    [self addConstraints:verticalConstraints];
    [self addConstraints:horizontalConstraints];
}

@end
