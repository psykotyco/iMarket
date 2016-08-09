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
#import "Cart.h"

@interface DataManager ()

@property (nonatomic, strong) Cart *cart;

@end

@implementation DataManager

#pragma mark - ---- LIFE CYCLE

+ (id) sharedInstance {
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [self new];
        sharedDataManager.cart = [Cart new];
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

#pragma mark - ---- ---- CART

- (CGFloat) getCartTotalAmount {
    return [self.cart totalAmount];
}

- (void) addProductToCart:(Product *) product quantity:(NSInteger) quantity {
    [self.cart addProduct:product quantity:quantity];
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Cart_Product_Added object:nil];
}

- (void) removeProductToCart:(Product *) product quantity:(NSInteger) quantity {
    [self.cart removeProduct:product quantity:quantity];
        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Cart_Product_Removed object:nil];
}

- (NSInteger) getProductQuantityWithProductId:(NSString *) productId {
    return [self.cart getProductQuantityWithProductId:productId];
}

- (NSArray *) getProductsInCart {
    return [self.cart products];
}

@end
