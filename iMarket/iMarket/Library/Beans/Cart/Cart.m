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

@property (nonatomic, strong) NSMutableDictionary *itemsInCartQuantity;
@property (nonatomic, strong) NSMutableArray *itemsInCart;

@end

@implementation Cart

#pragma mark - ---- LIFE CYCLE

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemsInCartQuantity = [NSMutableDictionary new];
        _itemsInCart = [NSMutableArray new];
    }
    return self;
}

#pragma mark - ---- INTERNAL

- (NSNumber *) getProductQuantityWithProductId:(NSString *) productId {
    return [self.itemsInCartQuantity objectForKey:productId];
}

- (Product *) getProductInCartWithProductId:(NSString *) productId {
    for (Product *product in self.itemsInCart) {
        if ([product.identifier isEqualToString:productId]) {
            return product;
        }
    }
    return nil;
}

#pragma mark - ---- ---- Override

- (CGFloat) totalAmount {
    CGFloat result = 0;
    for (NSString *key in self.itemsInCartQuantity.allKeys) {
        NSNumber *itemQuantity = [self.itemsInCartQuantity objectForKey:key];
        Product *product = [self getProductInCartWithProductId:key];
        result += product.price * [itemQuantity intValue];
    }
    
    return result;
}

- (NSArray *) items {
    return [NSArray arrayWithArray:self.itemsInCart];
}

#pragma mark - ---- PUBLIC

- (void) addProduct:(Product *) product quantity:(NSInteger) quantity {
    NSNumber *previousQuantity = [self getProductQuantityWithProductId:product.identifier];

    if ([previousQuantity intValue] == 0) {
        [self.itemsInCart addObject:product];
    }

    NSNumber *newQuantity = [NSNumber numberWithInteger:[previousQuantity integerValue] + quantity];
    [self.itemsInCartQuantity setObject:newQuantity forKey:product.identifier];
}

- (void) removeProduct:(Product *) product quantity:(NSInteger) quantity {
    NSNumber *previousQuantity = [self getProductQuantityWithProductId:product.identifier];
    
    if ([previousQuantity intValue] - quantity <= 0 ) {
        [self.itemsInCart removeObject:product];
        [self.itemsInCartQuantity removeObjectForKey:product.identifier];
    } else {
        
        NSNumber *newQuantity = [NSNumber numberWithInteger:[previousQuantity integerValue] - quantity];
        [self.itemsInCartQuantity setObject:newQuantity forKey:product.identifier];
    }
}

@end
