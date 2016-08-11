//
//  BaseViewController.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewControllerProtocol.h"

@class DataManager;

@interface BaseViewController : UIViewController <BaseViewControllerProtocol>

@property (nonatomic, weak) IBOutlet UIView *loading;
@property (nonatomic, strong) DataManager *dataManager;

@end
