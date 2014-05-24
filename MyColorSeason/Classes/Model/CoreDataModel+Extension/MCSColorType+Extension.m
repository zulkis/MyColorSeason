//
//  MCSColorType+Extension.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSColorType+Extension.h"

#import "NSDate+MCSFormat.h"

@implementation MCSColorType (Extension)

@dynamic image;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    self.date = [NSDate date];
}

- (NSString *)colorTypeTitle {
    return self.confirmed ? @"Will be color type here" : NSLocalizedString(@"Unconfirmed color type", nil);
}

- (NSString *)dateString {
    return [self.date defaultStringValue];
}

- (UIImage *)image {
    return [UIImage imageWithData:self.imageData];
}

- (void)setImage:(UIImage *)image {
    self.imageData = UIImageJPEGRepresentation(image, .7f);
}

@end
