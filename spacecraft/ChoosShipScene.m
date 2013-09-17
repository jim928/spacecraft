//
//  ChoosShipScene.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "ChoosShipScene.h"
#import "FightScene.h"

@interface ChoosShipScene (){
    BOOL choosed;
}

@end

@implementation ChoosShipScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (choosed) {
        return;
    }
    [self runAction:[SKAction playSoundFileNamed:@"menu.caf" waitForCompletion:NO]];

    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:0.3];
    FightScene *fight = [[FightScene alloc]initWithSize:self.size];
    [self.scene.view presentScene:fight transition:reveal];
}
@end
