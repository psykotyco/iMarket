//
//  Constants.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

// Segue
extern NSString *const Segue_navigate_product_detail_from_products_list;

// Products
extern int const        Product_Number;
extern NSString *const  Product_Identifier[];
extern NSString *const  Product_Localizable_Names[];
extern NSString *const  Product_Localizable_Package[];
extern NSString *const  Product_Localizable_Descriptions[];
extern NSString *const  Product_Image_Name[];
extern CGFloat const    Product_Prices[];

// Images
extern NSString *const Image_Right_Arrow;

// Currency
extern NSString *const Default_Currency_Symbol;

//// Localizable

// Layout Titles
extern NSString *const Layout_ProductList_NavigationBar_Title_Localizable_Key;
extern NSString *const Layout_ProductDetail_NavigationBar_Title_Localizable_Key;

// Outlets
extern NSString *const ProductDetail_AddToCart_Button_Title_Localizable_Key;

// Products
extern NSString *const Product_Package_Conjunction_Localizable_Key;
extern NSString *const Product_Peas_Package_Localizable_Key;
extern NSString *const Product_Eggs_Package_Localizable_Key;
extern NSString *const Product_Milk_Package_Localizable_Key;
extern NSString *const Product_Beans_Package_Localizable_Key;

@interface Constants : NSObject

@end
