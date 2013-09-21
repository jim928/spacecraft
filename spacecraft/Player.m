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

-(id)initWithTexture:(SKTexture *)texture HP:(int)hpnum{
    if (self = [super initWithTexture:texture]) {
        self.hp = hpnum;
        self.name = @"player";
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(2, 2)];
        self.physicsBody.dynamic = NO;
        self.physicsBody.categoryBitMask = heroCategory;
        self.physicsBody.contactTestBitMask = monsterBulletCategory;
    }
    return self;
}

@end
