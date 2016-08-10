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
#import "Currencies.h"
#import "ConnectionManager.h"

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

- (NSInteger) getProductsQuantityInCart {
    return [self.cart getTotalProductsInCart];
}

- (NSInteger) getProductQuantityWithProductId:(NSString *) productId {
    return [self.cart getProductQuantityWithProductId:productId];
}

- (NSArray *) getProductsInCart {
    return [self.cart products];
}

#pragma mark - ---- ---- CURRENCIES

- (void) getCurrenciesWithCompletionBlock:(void (^)(Currencies *currencies)) block {
    ConnectionManager *connectionManager = [[ConnectionManager alloc] init];
    
    NSDictionary *queryParams = @{Currency_Api_Key_Param_Key:Currency_Api_Key};
    
    [connectionManager launchUrl:Currency_Server_Endpoint withHeaders:nil queryParams:queryParams withCompletionBlock:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        NSError *jsonParsingError = nil;
        NSDictionary *parsedResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:0 error:&jsonParsingError];
        
        block([[Currencies alloc] initWithDictionary:parsedResponse]);
    }];
}

@end
