//
//  MCSColorType+Extension.h
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSColorType.h"

@interface MCSColorType (Extension)

@property (nonatomic, readonly) NSString *colorTypeTitle;
@property (nonatomic, readonly) NSString *dateString;
@property (nonatomic, strong) UIImage *image;

@end
