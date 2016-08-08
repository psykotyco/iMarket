//
//  Constants.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Constants.h"

//// Segue

NSString *const Segue_navigate_product_detail_from_products_list = @"ShowProductDetailFromProductsList";

//// Product

int const Product_Number = 4;
NSString *const Product_Localizable_Names[] = {
    @"peasName",
    @"eggsName",
    @"milkName",
    @"beansName"};

NSString *const Product_Localizable_Descriptions[] = {
    @"peasDescription",
    @"eggsDescription",
    @"milkDescription",
    @"beansDescription"};

NSString *const  Product_Image_Name[] = {
    @"Peas",
    @"Eggs",
    @"Milk",
    @"Beans"
};

CGFloat const Product_Prices[] = {
    0.95,
    2.10,
    1.30,
    0.73};

//// Currency
NSString *const Default_Currency_Symbol = @"$";

@implementation Constants

@end
