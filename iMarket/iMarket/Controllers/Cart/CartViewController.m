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
#import "StyleSheet.h"
#import "Currencies.h"
#import "Currency.h"

static NSString *const kProductCart_Cell_Reuse_Identifier = @"ProductCartCellReuseIdentifier";
static CGFloat const kProductList_Cell_Height = 100.0f;
static int const kProductCart_Cell_Image_Tag = 10;
static int const kProductCart_Cell_Name_Tag = 11;
static int const kProductCart_Cell_Price_Tag = 12;
static int const kProductCart_Cell_Quantity_Tag = 13;
static int const kProductCart_Cell_Remove_Tag = 14;

@interface CartViewController () <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *headerContainer;
@property (nonatomic, weak) IBOutlet UILabel *layoutTitle;
@property (nonatomic, weak) IBOutlet UITableView *cartProducts;
@property (nonatomic, weak) IBOutlet UILabel *totalPrice;
@property (nonatomic, weak) IBOutlet UILabel *totalProducts;
@property (nonatomic, weak) IBOutlet UIButton *showATotalAmountOtherCurrencies;

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, assign) NSInteger numberProductsInCart;
@property (nonatomic, assign) CGFloat totalAmount;

@property (nonatomic, strong) Currencies *currencies;
@property (nonatomic, strong) UIPickerView *pickerView;

- (IBAction)closePressed:(id)sender;
- (IBAction)showATotalAmountOtherCurrenciesPressed:(id)sender;

@end

@implementation CartViewController

#pragma mark - ---- LIFE CYCLE

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- OVERRIDE

- (void) initalizeInterface {
    [self.headerContainer setBackgroundColor:[StyleSheet getMainColor]];
    self.layoutTitle.text = NSLocalizedString(Layout_CartDetail_Modal_Title_Localizable_Key, nil);
    [self.showATotalAmountOtherCurrencies setTitle:NSLocalizedString(CartDetail_ChangeCurrency_Button_Title_Show_Localizable_Key, nil) forState:UIControlStateNormal];
    [self loadDatasAndRefreshInterface];
}

- (void) loadDatasAndRefreshInterface {
    self.loading.hidden = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.products = [self.dataManager getProductsInCart];
        self.totalAmount = [self.dataManager getCartTotalAmount];
        self.numberProductsInCart = [self.dataManager getProductsQuantityInCart];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.loading.hidden = YES;
            if (self.totalAmount > 0) {
                self.totalPrice.text = [NSString stringWithFormat:@"%@ %.2f", Default_Currency_Symbol, self.totalAmount];
                self.totalProducts.text = [NSString stringWithFormat:@"%li", self.numberProductsInCart];
                [self.cartProducts reloadData];
            } else {
                [self closePressed:nil];
            }
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
    productQuantity.text = [NSString stringWithFormat:@"%li",(long)[self.dataManager getProductQuantityWithProductId:product.identifier]];
    [productRemove addTarget:self action:@selector(removeProductSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    return result;
}

#pragma mark - ---- ---- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kProductList_Cell_Height;
}

#pragma mark - ---- ---- UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.currencies.currencies.count;
}

#pragma mark - ---- ---- UIPickerViewDelegate

- (NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Currency *currency = [self.currencies.currencies objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ %.2f", currency.name, self.totalAmount * currency.value.floatValue];
}

#pragma mark - ---- ---- IBAction

- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showATotalAmountOtherCurrenciesPressed:(id)sender {
    if (self.pickerView) {
        [self.showATotalAmountOtherCurrencies setTitle:NSLocalizedString(CartDetail_ChangeCurrency_Button_Title_Show_Localizable_Key, nil) forState:UIControlStateNormal];
        [self.pickerView removeFromSuperview];
        self.pickerView = nil;
    } else {
        self.loading.hidden = NO;
        [self.dataManager getCurrenciesWithCompletionBlock:^(Currencies *currencies) {
            self.loading.hidden = YES;
            self.currencies = currencies;
            
            self.pickerView = [[UIPickerView alloc] initWithFrame:self.cartProducts.frame];
            [self.pickerView setBackgroundColor:[UIColor whiteColor]];
            [self.pickerView setDataSource:self];
            [self.pickerView setDelegate:self];
            [self.view addSubview:self.pickerView];
            [self.showATotalAmountOtherCurrencies setTitle:NSLocalizedString(CartDetail_ChangeCurrency_Button_Title_Hide_Localizable_Key, nil) forState:UIControlStateNormal];
        }];
    }
}

- (void)removeProductSelected:(UIButton *)sender {
    UITableViewCell* cell = (UITableViewCell*)[sender superview];
    Product* productSelected = [self.products objectAtIndex:[[self.cartProducts indexPathForCell:cell] row]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.dataManager removeProductToCart:productSelected quantity:Default_Items_Number_Add_Remove_To_Cart];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self loadDatasAndRefreshInterface];
        });
    });
}


#pragma mark - ---- PUBLIC


@end
