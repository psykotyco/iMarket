//
//  Cart.h
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@class Product;

@interface Cart : NSObject

@property (nonatomic, readonly) NSArray *products;
@property (nonatomic, readonly) CGFloat totalAmount;

- (void) addProduct:(Product *) product quantity:(NSInteger) quantity;
- (void) removeProduct:(Product *) product quantity:(NSInteger) quantity;
- (NSInteger) getProductQuantityWithProductId:(NSString *) productId;
- (Product *) getProductInCartWithProductId:(NSString *) productId;

@end
