//
//  MCSColorType.h
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MCSColorType : NSManagedObject

@property (nonatomic) BOOL confirmed;
@property (nonatomic) NSDate *date;
@property (nonatomic) int32_t hue;
@property (nonatomic, retain) id imageData;
@property (nonatomic) int32_t saturation;
@property (nonatomic) int32_t value;

@end
