//
//  CartViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

- (IBAction)closePressed:(id)sender;

@end

@implementation CartViewController

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- IBAction

- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ---- PUBLIC


@end
