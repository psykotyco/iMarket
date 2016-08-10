//
//  iMarketTests.m
//  iMarketTests
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "DataManager.h"
#import "Constants.h"
#import "Currencies.h"
#import "Currency.h"
#import "Product.h"

const NSTimeInterval kNetwork_Tests_Timeout = 20;

@interface iMarketTests : XCTestCase

@end

@implementation iMarketTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testGetCurrencies_Ok {
    __block XCTestExpectation *getCurrenciesOkExpectation = [self expectationWithDescription:@"get server currencies ok"];
    [[DataManager sharedInstance] getCurrenciesWithCompletionBlock:^(Currencies *currencies) {
        XCTAssert(currencies.currencies.count > 0, "Currencies are empty!!!!");
        [getCurrenciesOkExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:kNetwork_Tests_Timeout handler:^(NSError * _Nullable error) {
        NSLog(@"%@", error.description);
    }];
}

- (void)testGetProductsNumber_Ok {
    NSArray *products = [[DataManager sharedInstance] getProducts];
    XCTAssert(products.count == 4, "The prodcuct number has to be 4!!!!");
}

- (void)testProductsDetail_Name_Ok {
    NSArray *products = [[DataManager sharedInstance] getProducts];
    
    for (Product *product in products) {
        Product *productDetail = [[DataManager sharedInstance] getProductDetailWithId:Product_Identifier[[products indexOfObject:product]]];
        XCTAssert([product.name isEqualToString:productDetail.name], "Product Detail Name: %@ Is not correct", productDetail.name);
    }
}

- (void)testProductsDetail_Identifier_Ok {
    NSArray *products = [[DataManager sharedInstance] getProducts];
    
    for (Product *product in products) {
        Product *productDetail = [[DataManager sharedInstance] getProductDetailWithId:Product_Identifier[[products indexOfObject:product]]];
        XCTAssert([product.identifier isEqualToString:productDetail.identifier], "Product Detail identifier: %@ Is not correct", productDetail.identifier);
    }
}

@end
