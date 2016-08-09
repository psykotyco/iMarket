//
//  DataManager.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "DataManager.h"

#import "Constants.h"
#import "Product.h"

@implementation DataManager

#pragma mark - ---- LIFE CYCLE

+ (id) sharedInstance {
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [[self alloc] init];
    });
    return  sharedDataManager;
}

#pragma mark - ---- INTERNAL

#pragma mark - ---- PUBLIC

#pragma mark - ---- ---- PRODUCTS

- (NSArray *) getProducts {
    NSMutableArray *result = [NSMutableArray new];
    
    for (int i = 0; i < Product_Number; i++) {
        Product *product = [Product new];
        
        product.identifier = Product_Identifier[i];
        product.name = NSLocalizedString(Product_Localizable_Names[i], nil);
        product.price = Product_Prices[i];
        product.package = NSLocalizedString(Product_Localizable_Package[i], nil);
        product.imageName = Product_Image_Name[i];
        product.completeDescription = NSLocalizedString(Product_Localizable_Descriptions[i], nil);
        
        [result addObject:product];
    }
    
    return [NSArray arrayWithArray:result];
}

- (Product *) getProductDetailWithId:(NSString *) productId {
    NSArray *products = [self getProducts];
    
    for (Product *product in products) {
        if ([product.identifier isEqualToString:productId]) {
            return product;
        }
    }
    
    return nil;
}

@end
