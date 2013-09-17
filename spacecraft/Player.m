//
//  Player.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "Player.h"

@interface Player (){
}

@end

@implementation Player

-(id)initWithImageNamed:(NSString *)name HP:(int)hpnum{
    if (self = [super initWithImageNamed:name]) {
        self.hp = hpnum;
    }
    return self;
}

@end
