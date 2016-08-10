//
//  Constants.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

// Api Keys
extern NSString *const Currency_Api_Key;

// Network
extern NSString *const Currency_Server_Endpoint;
extern NSString *const Currency_Api_Key_Param_Key;

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

// Product Detail
extern NSInteger const Default_Items_Number_Add_Remove_To_Cart;

// Notifications
extern NSString *const Notification_Cart_Product_Added;
extern NSString *const Notification_Cart_Product_Removed;

// Storyboard
extern NSString *const Storyboard_Main;

//// Localizable

// Layout Titles
extern NSString *const Layout_ProductList_NavigationBar_Title_Localizable_Key;
extern NSString *const Layout_ProductDetail_NavigationBar_Title_Localizable_Key;
extern NSString *const Layout_CartDetail_Modal_Title_Localizable_Key;

// Outlets
extern NSString *const ProductDetail_AddToCart_Button_Title_Localizable_Key;
extern NSString *const CartDetail_ChangeCurrency_Button_Title_Show_Localizable_Key;
extern NSString *const CartDetail_ChangeCurrency_Button_Title_Hide_Localizable_Key;

// Products
extern NSString *const Product_Package_Conjunction_Localizable_Key;
extern NSString *const Product_Peas_Package_Localizable_Key;
extern NSString *const Product_Eggs_Package_Localizable_Key;
extern NSString *const Product_Milk_Package_Localizable_Key;
extern NSString *const Product_Beans_Package_Localizable_Key;

// Currencies
extern NSString *const kCurrencyListValues_Key;
extern NSString *const kCurrencySource_Key;

@interface Constants : NSObject

@end
