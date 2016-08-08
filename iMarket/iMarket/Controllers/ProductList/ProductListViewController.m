//
//  ProductListViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "ProductListViewController.h"

#import "DataManager.h"
#import "Product.h"

static NSString *const kProductList_Cell_Reuse_Identifier = @"ProductListCellReuseIdentifier";
static int const kProduct_Cell_Image_Tag = 10;
static int const kProduct_Cell_Name_Tag = 11;
static int const kProduct_Cell_Price_Tag = 12;

@interface ProductListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *productTable;

@property (nonatomic, strong) NSArray *products;

@end

@implementation ProductListViewController

#pragma mark - ---- LIFE CICLE

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadProductsAndRefreshInterface];
}

#pragma mark - ---- INTERNAL

- (void) loadProductsAndRefreshInterface {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.products = [[DataManager sharedInstance] getProducts];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.productTable reloadData];
        });
    });
}

#pragma mark - ---- ---- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *result = [tableView dequeueReusableCellWithIdentifier:kProductList_Cell_Reuse_Identifier];
    
    Product *product = [self.products objectAtIndex:indexPath.row];
    
    UIImageView *productImage = [result.contentView viewWithTag:kProduct_Cell_Image_Tag];
    UILabel *productName = [result.contentView viewWithTag:kProduct_Cell_Name_Tag];
    UILabel *productPrice = [result.contentView viewWithTag:kProduct_Cell_Price_Tag];
    
    productImage.image = [UIImage imageNamed:product.imageName];
    productName.text = product.name;
    productPrice.text = [NSString stringWithFormat:@"$%.2f", product.price];
    
    return result;
}

#pragma mark - ---- ---- UITableViewDelegate

#pragma mark - ---- PUBLIC

@end
