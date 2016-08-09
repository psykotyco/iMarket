//
//  BottomCartView.m
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "BottomCartView.h"

#import "DataManager.h"
#import "Constants.h"
#import "StyleSheet.h"

@interface BottomCartView ()

@property (nonatomic, weak) IBOutlet UILabel *totalAmount;

@end

@implementation BottomCartView

#pragma mark - ---- LIFE CYCLE

- (void) awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCart) name:Notification_Cart_Product_Added object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCart) name:Notification_Cart_Product_Removed object:nil];
    
    self.backgroundColor = [StyleSheet getSecondaryColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    [self addGestureRecognizer:tapGesture];
    
    [self refreshCart];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - ---- INTERNAL

- (void) viewTapped:(id) sender {
    if ([self.delegate respondsToSelector:@selector(bottomCartViewDidSelected:)]) {
        [self.delegate bottomCartViewDidSelected:self];
    }
}

#pragma mark - ---- PUBLIC

- (void) refreshCart {
    __block CGFloat totalAmountValue;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        totalAmountValue = [[DataManager sharedInstance] getCartTotalAmount];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.totalAmount.text = [NSString stringWithFormat:@"%@ %.2f", Default_Currency_Symbol, totalAmountValue];
        });
    });

}

@end
