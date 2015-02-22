//
//  FoodItemDetail.h
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"

@interface FoodItemDetail : UIViewController

@property (atomic) FoodItem *item;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoritesButton;


@end
