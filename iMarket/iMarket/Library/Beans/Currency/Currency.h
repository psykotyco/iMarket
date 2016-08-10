//
//  Currency.h
//  iMarket
//
//  Created by Ricardo Suarez on 10/08/16.
//  Copyright © 2016 Ricardo Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface Currency : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSNumber *value;

- (id) initWithName:(NSString *) name value:(NSNumber *) value;

@end
