//
//  ProductDetailViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ProductDetailViewController.h"

#import "DataManager.h"
#import "Constants.h"
#import "Product.h"

@interface ProductDetailViewController ()

@property (nonatomic, strong) Product *product;

@end

@implementation ProductDetailViewController

#pragma mark - ---- LIFE CICLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- OVERRIDE

- (void) customizeNavigationBar {
    [super customizeNavigationBar];
    [self setTitle:NSLocalizedString(Layout_ProductDetail_NavigationBar_Title_Localizable_Key, nil)];
}

- (void) loadDatasAndRefreshInterface {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.product = [[DataManager sharedInstance] getProductDetailWithId:self.productId];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self displayProduct:self.product];
        });
    });
}

- (void) displayProduct:(Product *) product {
    
}

#pragma mark - ---- PUBLIC

@end
