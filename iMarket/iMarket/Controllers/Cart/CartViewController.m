//
//  CartViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "CartViewController.h"

#import "DataManager.h"
#import "Product.h"
#import "Product+NSString.h"
#import "Constants.h"

static NSString *const kProductCart_Cell_Reuse_Identifier = @"ProductCartCellReuseIdentifier";
static CGFloat const kProductList_Cell_Height = 100.0f;
static int const kProductCart_Cell_Image_Tag = 10;
static int const kProductCart_Cell_Name_Tag = 11;
static int const kProductCart_Cell_Price_Tag = 12;
static int const kProductCart_Cell_Quantity_Tag = 13;
static int const kProductCart_Cell_Remove_Tag = 14;

@interface CartViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *cartProducts;
@property (nonatomic, weak) IBOutlet UILabel *totalPrice;
@property (nonatomic, weak) IBOutlet UILabel *totalProducts;

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, assign) NSInteger numberProductsInCart;
@property (nonatomic, assign) CGFloat totalAmount;

- (IBAction)closePressed:(id)sender;

@end

@implementation CartViewController

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- OVERRIDE

- (void) initalizeInterface {
    [self loadDatasAndRefreshInterface];
}

- (void) loadDatasAndRefreshInterface {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.products = [[DataManager sharedInstance] getProductsInCart];
        self.totalAmount = [[DataManager sharedInstance] getCartTotalAmount];
        self.numberProductsInCart = [[DataManager sharedInstance] getProductsQuantityInCart];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.totalPrice.text = [NSString stringWithFormat:@"%@ %.2f", Default_Currency_Symbol, self.totalAmount];
            self.totalProducts.text = [NSString stringWithFormat:@"%li", self.numberProductsInCart];
            [self.cartProducts reloadData];
        });
    });
}

#pragma mark - ---- ---- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *result = [tableView dequeueReusableCellWithIdentifier:kProductCart_Cell_Reuse_Identifier];
    result.tag = indexPath.row;
    
    Product *product = [self.products objectAtIndex:indexPath.row];
    
    UIImageView *productImage = [result.contentView viewWithTag:kProductCart_Cell_Image_Tag];
    UILabel *productName = [result.contentView viewWithTag:kProductCart_Cell_Name_Tag];
    UILabel *productPrice = [result.contentView viewWithTag:kProductCart_Cell_Price_Tag];
    UILabel *productQuantity = [result.contentView viewWithTag:kProductCart_Cell_Quantity_Tag];
    UIButton *productRemove = [result.contentView viewWithTag:kProductCart_Cell_Remove_Tag];
    
    productImage.image = [UIImage imageNamed:product.imageName];
    productName.text = product.name;
    productPrice.text = [product getFormattedStringPriceByPackage];
    productQuantity.text = [NSString stringWithFormat:@"%li",(long)[[DataManager sharedInstance] getProductQuantityWithProductId:product.identifier]];
    [productRemove addTarget:self action:@selector(removeProductSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    return result;
}

#pragma mark - ---- ---- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kProductList_Cell_Height;
}


#pragma mark - ---- ---- IBAction

- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)removeProductSelected:(UIButton *)sender {
    UITableViewCell* cell = (UITableViewCell*)[sender superview];
    Product* productSelected = [self.products objectAtIndex:[[self.cartProducts indexPathForCell:cell] row]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[DataManager sharedInstance] removeProductToCart:productSelected quantity:Default_Items_Number_Add_Remove_To_Cart];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self loadDatasAndRefreshInterface];
        });
    });
}



#pragma mark - ---- PUBLIC


@end