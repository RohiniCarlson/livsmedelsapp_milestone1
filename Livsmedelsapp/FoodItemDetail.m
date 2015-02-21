//
//  FoodItemDetail.m
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "FoodItemDetail.h"

@interface FoodItemDetail ()

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@property (weak, nonatomic) IBOutlet UILabel *energyLabel;

@property (weak, nonatomic) IBOutlet UILabel *fatContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *fibreContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *waterContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *proteinContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *carbsContentLabel;

@end

@implementation FoodItemDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *itemName = [self.item name];
    self.itemLabel.text = [NSString stringWithFormat:@"Näringsvärden för %@ (per 100g)",itemName];
    NSRange range1 = [self.itemLabel.text rangeOfString:itemName];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.itemLabel.text];
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont italicSystemFontOfSize:18.0f]} range:range1];
    self.itemLabel.attributedText=attributedText;
    
    self.energyLabel.text = [NSString stringWithFormat:@"Innehåller %.0f kcal",[self.item energy]];
    
    self.fatContentLabel.text = [NSString stringWithFormat:@":  %.1fg",[self.item fat]];
    
    self.fibreContentLabel.text = [NSString stringWithFormat:@":  %.1fg",[self.item fibre]];
    
    self.waterContentLabel.text = [NSString stringWithFormat:@":  %.1fg",[self.item water]];
    
    self.proteinContentLabel.text = [NSString stringWithFormat:@":  %.1fg",[self.item protein]];
    
    self.carbsContentLabel.text = [NSString stringWithFormat:@":  %.1fg",[self.item carbohydrates]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
