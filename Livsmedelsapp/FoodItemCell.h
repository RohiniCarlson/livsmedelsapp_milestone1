//
//  FoodItemCell.h
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodItemCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *foodItemLabel;
@property (nonatomic, weak) IBOutlet UILabel *fatContentLabel;

@end
