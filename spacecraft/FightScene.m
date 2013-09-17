//
//  FightScene.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "FightScene.h"
#import "Player.h"

@interface FightScene (){
    Player *playerShip;
}

@end

@implementation FightScene
-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        [self runAction:[SKAction repeatActionForever:[SKAction playSoundFileNamed:@"waves.caf" waitForCompletion:YES]]];
        
        playerShip = [[Player alloc]initWithImageNamed:@"corsair" HP:100];
        playerShip.size = CGSizeMake(50, 50);
        playerShip.position = CGPointMake(CGRectGetMidX(self.frame), 25);
        
        
        [self addChild:playerShip];
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
@end
