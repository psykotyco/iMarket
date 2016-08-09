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
@class Cart;

@interface DataManager : NSObject

+ (id) sharedInstance;

- (instancetype) init __attribute__((unavailable("init not available")));

// Products

- (NSArray *) getProducts;
- (Product *) getProductDetailWithId:(NSString *) productId;

// Cart

- (CGFloat) getCartTotalAmount;
- (NSInteger) getProductQuantityWithProductId:(NSString *) productId;
- (NSArray *) getProductsInCart;
- (void) addProductToCart:(Product *) product quantity:(NSInteger) quantity;
- (void) removeProductToCart:(Product *) product quantity:(NSInteger) quantity;

@end
