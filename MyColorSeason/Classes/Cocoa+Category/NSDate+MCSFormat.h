//
//  NSDate+MCSFormat.h
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MCSFormat)

- (NSString *)dateStringWithFormat:(NSString *)format;
- (NSString *)defaultStringValue;

@end
