//
//  MCSColorTypeTableViewCell.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 24/05/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSColorTypeTableViewCell.h"

@implementation MCSColorTypeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
