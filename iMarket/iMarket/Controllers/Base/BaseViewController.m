//
//  BaseViewController.m
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import "BaseViewController.h"

#import "UIView+Utilities.h"
#import "StyleSheet.h"
#import "BottomCartView.h"
#import "CartViewController.h"
#import "Constants.h"

@interface BaseViewController () <BottomCartViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *bottomCartContainer;

@end

@implementation BaseViewController

#pragma mark - ---- LIFE CYCLE

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initalizeInterface];
}

#pragma mark - ---- INTERNAL

#pragma mark - ---- ---- BottomCartViewDelegate

- (void) bottomCartViewDidSelected:(BottomCartView *)bottomCartView {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:Storyboard_Main bundle:nil];
    CartViewController *cart = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([CartViewController class])];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFromBottom;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController presentViewController:cart animated:YES completion:nil];
}

#pragma mark - ---- PUBLIC

- (void) initalizeInterface {
    [self customizeNavigationBar];
    [self addBottomCart];
    [self loadDatasAndRefreshInterface];
}

- (void) customizeNavigationBar {
    [self.navigationController.navigationBar setBackgroundColor:[StyleSheet getMainColor]];
}

- (void) loadDatasAndRefreshInterface {
}

- (void) addBottomCart {
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BottomCartView class])
                                                      owner:self
                                                    options:nil];
    
    BottomCartView *bottomCart = [nibViews firstObject];
    bottomCart.delegate = self;
    [self.bottomCartContainer addFullSizeSubview:bottomCart];
}

@end
