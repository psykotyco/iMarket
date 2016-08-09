//
//  Product.h
//  iMarket
//
//  Created by Ricardo Suarez on 08/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface Product : NSObject

@property (nonatomic, copy)     NSString *identifier;
@property (nonatomic, copy)     NSString *name;
@property (nonatomic, assign)   CGFloat price;
@property (nonatomic, copy)     NSString *imageName;
@property (nonatomic, copy)     NSString *completeDescription;

@end
