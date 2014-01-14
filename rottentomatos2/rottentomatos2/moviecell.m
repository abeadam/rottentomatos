//
//  moviecell.m
//  rottentomatos2
//
//  Created by Abraham Adam on 1/13/14.
//  Copyright (c) 2014 yahoo.com. All rights reserved.
//

#import "moviecell.h"
@interface moviecell ()
@property (nonatomic, weak) IBOutlet UILabel * title;
@property (nonatomic, weak) IBOutlet UILabel * description;
@end
@implementation moviecell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
