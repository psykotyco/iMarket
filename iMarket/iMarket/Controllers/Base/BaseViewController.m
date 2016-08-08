//
//  BaseViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "BaseViewController.h"

#import "StyleSheet.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - ---- LIFE CICLE

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initalizeInterface];
}

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

- (void) initalizeInterface {
    [self.navigationController.navigationBar setBackgroundColor:[StyleSheet getMainColor]];
    [self customizeNavigationBar];
}

- (void) customizeNavigationBar {

}

@end
