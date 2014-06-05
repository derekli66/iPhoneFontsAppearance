//
//  DKTableViewCell.m
//  iPhoneFontsAppearance
//
//  Created by LEE CHIEN-MING on 12/28/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import "DKTableViewCell.h"

@implementation DKTableViewCell

+(DKTableViewCell *)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DKTableViewCell" owner:nil options:nil] lastObject];
}

-(void)prepareForReuse
{
    [super prepareForReuse];
    
    self.bigTitleLabel.text = @"";
    self.subtitleLabel.text = @"";
    self.fontNameLabel.text = @"";
    self.bigTitleLabel.font = [UIFont systemFontOfSize:22.0f];
    self.subtitleLabel.font = [UIFont systemFontOfSize:14.0f];
    self.fontNameLabel.font = [UIFont systemFontOfSize:17.0f];
}

@end
