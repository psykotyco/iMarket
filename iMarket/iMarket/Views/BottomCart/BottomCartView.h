//
//  BottomCartView.h
//  iMarket
//
//  Created by Ricardo Suarez on 09/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BottomCartView;

@protocol BottomCartViewDelegate <NSObject>

- (void) bottomCartViewDidSelected:(BottomCartView *) bottomCartView;

@end

@interface BottomCartView : UIView

@property (nonatomic, weak) id<BottomCartViewDelegate> delegate;

- (void) refreshCart;

@end
