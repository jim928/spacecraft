//
//  Boss.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "Boss.h"

@implementation Boss

-(id)initWithTexture:(SKTexture *)texture HP:(int)hpnum{
    if (self = [super initWithTexture:texture]) {
        self.hp = hpnum;
    }
    return self;
}

@end
