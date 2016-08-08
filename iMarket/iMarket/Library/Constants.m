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
    @"peas_name",
    @"eggs_name",
    @"milk_name",
    @"beans_name"};

NSString *const Product_Localizable_Descriptions[] = {
    @"peas_description",
    @"eggs_description",
    @"milk_description",
    @"beans_description"};

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


//Layout Titles

NSString *const Layout_ProductList_NavigationBar_Title_Localizable_Key = @"productList_navigationBar_title";

// Images

NSString *const Image_Right_Arrow = @"RightArrow";

@implementation Constants

@end