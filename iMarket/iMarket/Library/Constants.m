//
//  Constants.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "Constants.h"

// Segue

NSString *const Segue_navigate_product_detail_from_products_list = @"ShowProductDetailFromProductsList";

// Product

int const Product_Number = 4;

NSString *const  Product_Identifier[] = {
    @"1",
    @"2",
    @"3",
    @"4"
};

NSString *const Product_Localizable_Names[] = {
    @"peas_name",
    @"eggs_name",
    @"milk_name",
    @"beans_name"};

NSString *const Product_Localizable_Package[] = {
    @"peas_package",
    @"eggs_package",
    @"milk_package",
    @"beans_package"
};

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

// Currency

NSString *const Default_Currency_Symbol = @"$";

// Product Detail
NSInteger const Default_Items_Number_Add_Remove_To_Cart = 1;

// Images

NSString *const Image_Right_Arrow = @"RightArrow";

// Notifications

NSString *const Notification_Cart_Product_Added = @"Cart_Product_Added";
NSString *const Notification_Cart_Product_Removed = @"Cart_Product_Removed";

// Storyboard

NSString *const Storyboard_Main = @"Main";

//// Localizable

// Layout Titles

NSString *const Layout_ProductList_NavigationBar_Title_Localizable_Key = @"productList_navigationBar_title";
NSString *const Layout_ProductDetail_NavigationBar_Title_Localizable_Key = @"productDetail_navigationBar_title";
NSString *const Layout_CartDetail_Modal_Title_Localizable_Key = @"cartDetail_modal_title";

// Outlets

NSString *const ProductDetail_AddToCart_Button_Title_Localizable_Key = @"productDetail_addToCart_button_title";
NSString *const CartDetail_ChangeCurrency_Button_Title_Localizable_Key = @"cartDetail_changeCurrency_button_title";

// Products

NSString *const Product_Package_Conjunction_Localizable_Key = @"product_package_conjunction";

@implementation Constants

@end
