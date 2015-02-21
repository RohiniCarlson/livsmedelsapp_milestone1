//
//  FoodItem.m
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

-(instancetype)initWithName:(NSString*)name energy:(float)energy fat:(float)fat fibre:(float)fibre water:(float)water protein:(float)protein carbs:(float)carbohydrates; {
    
    self = [super init];
    if(self) {
        self.name = name;
        self.energy = energy;
        self.fibre = fibre;
        self.fat = fat;
        self.water = water;
        self.protein = protein;
        self.carbohydrates = carbohydrates;
    }    
    return self;
}

-(NSString*)description {
    return [NSString stringWithFormat:@"%@            fetthalt: %f", self.name, self.fat];
}

@end
