//
//  DKFontAppearanceViewController.m
//  iPhoneFontsAppearance
//
//  Created by LEE CHIEN-MING on 12/28/13.
//  Copyright (c) 2013 Derek. All rights reserved.
//

#import "DKFontAppearanceViewController.h"
#import "DKTableViewCell.h"

@interface DKFontAppearanceViewController ()
@end

@implementation DKFontAppearanceViewController
#pragma mark - Initialization
-(id)init
{
    self = [super initWithNibName:@"DKFontAppearanceViewController" bundle:nil];
    if (self) {
        _fontsArray = [NSMutableArray array];
        [self reloadFonts];
    }
    
    return self;
}

#pragma mark - Reload Fonts
-(void)reloadFonts
{
    [self.fontsArray removeAllObjects];
    
    // List all fonts on iPhone
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    
    //Add Lato family fonts
    [self.fontsArray addObject:@"Lato-BlackItalic"];
    [self.fontsArray addObject:@"Lato-Black"];
    [self.fontsArray addObject:@"Lato-Bold"];
    [self.fontsArray addObject:@"Lato-BoldItalic"];
    [self.fontsArray addObject:@"Lato-Hairline"];
    [self.fontsArray addObject:@"Lato-HairlineItalic"];
    [self.fontsArray addObject:@"Lato-Italic"];
    [self.fontsArray addObject:@"Lato-Light"];
    [self.fontsArray addObject:@"Lato-LightItalic"];
    [self.fontsArray addObject:@"Lato-Regular"];
    
    //Add system family fonts
    //Reference from : http://stackoverflow.com/questions/9044584/font-familyname-programmatically-in-iphone
    for (indFamily = 0; indFamily < [familyNames count]; ++indFamily)
    {
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        
        for (indFont = 0; indFont < [fontNames count]; ++indFont)
        {
            NSLog(@"Font name: %@", [fontNames objectAtIndex:indFont]);
            [self.fontsArray addObject:[fontNames objectAtIndex:indFont]];
        }
    }
}

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.fontsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DKCellReused";
    DKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [DKTableViewCell cell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    UIFont *bigFont = [UIFont fontWithName:self.fontsArray[indexPath.row] size:22.0f];
    UIFont *smallFont = [UIFont fontWithName:self.fontsArray[indexPath.row] size:14.0f];
    
    cell.bigTitleLabel.font = bigFont;
    cell.bigTitleLabel.text = @"Getting More 明確地定義目標";//@"隨時溝通，開誠布公";
    
    cell.subtitleLabel.font = smallFont;
    cell.subtitleLabel.text = @"Getting More 明確地定義目標";//@"隨時溝通，開誠布公";
    
    cell.fontNameLabel.text = self.fontsArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95.0f;
}
@end
