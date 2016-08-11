//
//  ProductDetailViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ProductDetailViewController.h"

#import "DataManager.h"
#import "Constants.h"
#import "Product.h"
#import "Product+NSString.h"

@interface ProductDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *productImage;
@property (nonatomic, weak) IBOutlet UILabel *productName;
@property (nonatomic, weak) IBOutlet UILabel *productPrice;
@property (nonatomic, weak) IBOutlet UIButton *addToCart;
@property (nonatomic, weak) IBOutlet UITextView *productDescription;

@property (nonatomic, strong) Product *product;

- (IBAction)addToCartPressed:(id)sender;

@end

@implementation ProductDetailViewController

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

- (void) displayProduct:(Product *) product {
    self.productImage.image = [UIImage imageNamed:product.imageName];
    self.productName.text = product.name;
    self.productPrice.text = [product getFormattedStringPriceByPackage];
    self.productDescription.text = product.completeDescription;
}

#pragma mark - ---- ---- OVERRIDE

- (void) initalizeInterface {
    [self.addToCart setTitle:NSLocalizedString(ProductDetail_AddToCart_Button_Title_Localizable_Key, nil) forState:UIControlStateNormal];
    [super initalizeInterface];
}

- (void) customizeNavigationBar {
    [super customizeNavigationBar];
    [self setTitle:NSLocalizedString(Layout_ProductDetail_NavigationBar_Title_Localizable_Key, nil)];
}

- (void) loadDatasAndRefreshInterface {
    self.loading.hidden = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.product = [self.dataManager getProductDetailWithId:self.productId];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.loading.hidden = YES;
            [self displayProduct:self.product];
        });
    });
}

#pragma mark - ---- ---- IBAction

- (IBAction)addToCartPressed:(id)sender {
    self.loading.hidden = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.dataManager addProductToCart:self.product quantity:Default_Items_Number_Add_Remove_To_Cart];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.loading.hidden = YES;
        });
    });
}

#pragma mark - ---- PUBLIC

@end
