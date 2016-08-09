//
//  Cart.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Cart.h"

#import "Product.h"

@interface Cart ()

@property (nonatomic, strong) NSMutableDictionary *productsInCartQuantity;
@property (nonatomic, strong) NSMutableArray *productsInCart;

@end

@implementation Cart

#pragma mark - ---- LIFE CYCLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        _productsInCartQuantity = [NSMutableDictionary new];
        _productsInCart = [NSMutableArray new];
    }
    return self;
}

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- Override

- (CGFloat) totalAmount {
    CGFloat result = 0;
    for (NSString *key in self.productsInCartQuantity.allKeys) {
        NSNumber *productQuantity = [self.productsInCartQuantity objectForKey:key];
        Product *product = [self getProductInCartWithProductId:key];
        result += product.price * [productQuantity intValue];
    }
    
    return result;
}

- (NSArray *) products {
    return [NSArray arrayWithArray:self.productsInCart];
}

#pragma mark - ---- PUBLIC

- (void) addProduct:(Product *) product quantity:(NSInteger) quantity {
    NSInteger previousQuantity = [self getProductQuantityWithProductId:product.identifier];

    if (previousQuantity == 0) {
        [self.productsInCart addObject:product];
    }

    NSNumber *newQuantity = [NSNumber numberWithInteger:previousQuantity + quantity];
    [self.productsInCartQuantity setObject:newQuantity forKey:product.identifier];
}

- (void) removeProduct:(Product *) product quantity:(NSInteger) quantity {
    NSInteger previousQuantity = [self getProductQuantityWithProductId:product.identifier];
    
    if (previousQuantity - quantity <= 0 ) {
        [self.productsInCart removeObject:product];
        [self.productsInCartQuantity removeObjectForKey:product.identifier];
    } else {
        
        NSNumber *newQuantity = [NSNumber numberWithInteger:previousQuantity - quantity];
        [self.productsInCartQuantity setObject:newQuantity forKey:product.identifier];
    }
}

- (NSInteger) getProductQuantityWithProductId:(NSString *) productId {
    return [[self.productsInCartQuantity objectForKey:productId] integerValue];
}

- (Product *) getProductInCartWithProductId:(NSString *) productId {
    for (Product *product in self.productsInCart) {
        if ([product.identifier isEqualToString:productId]) {
            return product;
        }
    }
    return nil;
}

- (NSInteger) getTotalProductsInCart {
    NSInteger result = 0;
    
    for (Product *product in self.productsInCart) {
        result += [self getProductQuantityWithProductId:product.identifier];
    }
    
    return result;
}

@end
