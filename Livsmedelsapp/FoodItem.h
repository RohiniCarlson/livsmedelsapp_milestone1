//
//  FoodItem.h
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) float energy;
@property (nonatomic) float fibre;
@property (nonatomic) float fat;
@property (nonatomic) float water;
@property (nonatomic) float protein;
@property (nonatomic) float carbohydrates;

-(instancetype)initWithName:(NSString*)name energy:(float)energy fat:(float)fat fibre:(float)fibre water:(float)water protein:(float)protein carbs:(float)carbohydrates;

@end
