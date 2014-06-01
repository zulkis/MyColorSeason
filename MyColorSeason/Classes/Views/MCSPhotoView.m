//
//  MCSPhotoView.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 01/06/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSPhotoView.h"

@interface MCSPhotoView ()

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;
@property (nonatomic, weak) IBOutlet UIView *colorView;

@end

@implementation MCSPhotoView

- (void)setImage:(UIImage *)image color:(UIColor *)color {
    self.photoImageView.image = image;
    self.colorView.backgroundColor = [color colorWithAlphaComponent:0.02f];
}

@end
