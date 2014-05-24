//
//  NSDate+MCSFormat.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "NSDate+MCSFormat.h"

static NSString * const kDefaultDateFormat = @"MM/dd/yyyy";

@implementation NSDate (Additions)

static NSDateFormatter *_sharedDateFormatter;

+ (NSDateFormatter *)sharedFormatter {
    static NSDateFormatter *_sharedDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDateFormatter = [NSDateFormatter new];
    });
    return _sharedDateFormatter;
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[self class] sharedFormatter];
    formatter.dateFormat = dateFormat;
    return formatter;
}

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)dateFormat {
    return [[self dateFormatterWithFormat:dateFormat] dateFromString:dateString];
}

+ (NSDate *)dateWithString:(NSString *)dateString {
    return [self dateWithString:dateString format:kDefaultDateFormat];
}

- (NSString *)dateStringWithFormat:(NSString *)dateFormat {
    return [[[self class] dateFormatterWithFormat:dateFormat] stringFromDate:self];
}

- (NSString *)defaultStringValue {
    return [self dateStringWithFormat:kDefaultDateFormat];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    return [self dateByAddingTimeInterval:60. * 60. * 24. * days];
}

@end
