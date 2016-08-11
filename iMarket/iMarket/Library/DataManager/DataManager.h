//
//  DataManager.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class Product;
@class Currencies;

@interface DataManager : NSObject

// Products

- (NSArray *) getProducts;
- (Product *) getProductDetailWithId:(NSString *) productId;

// Cart

- (CGFloat) getCartTotalAmount;
- (NSInteger) getProductsQuantityInCart;
- (NSInteger) getProductQuantityWithProductId:(NSString *) productId;
- (NSArray *) getProductsInCart;
- (void) addProductToCart:(Product *) product quantity:(NSInteger) quantity;
- (void) removeProductToCart:(Product *) product quantity:(NSInteger) quantity;

// Currencies

- (void) getCurrenciesWithCompletionBlock:(void (^)(Currencies *currencies)) block;

@end
