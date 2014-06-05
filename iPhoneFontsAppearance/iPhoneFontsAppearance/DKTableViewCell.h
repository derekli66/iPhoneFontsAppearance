//
//  DKTableViewCell.h
//  iPhoneFontsAppearance
//
//  Created by LEE CHIEN-MING on 12/28/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *bigTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *fontNameLabel;

+(DKTableViewCell *)cell;
@end
