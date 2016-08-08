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
extern NSString *const  Product_Localizable_Names[];
extern NSString *const  Product_Localizable_Descriptions[];
extern NSString *const  Product_Image_Name[];
extern CGFloat const    Product_Prices[];

// Currency
extern NSString *const Default_Currency_Symbol;

// Layout Titles
extern NSString *const Layout_ProductList_NavigationBar_Title_Localizable_Key;

// Images
extern NSString *const Image_Right_Arrow;

@interface Constants : NSObject

@end
