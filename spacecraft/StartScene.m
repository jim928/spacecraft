//
//  StartScene.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "StartScene.h"
#import "ChoosShipScene.h"

@interface StartScene (){
    BOOL started;
}

@end

@implementation StartScene
-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Space craft";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (started) {
        return;
    }
    
    [self runAction:[SKAction playSoundFileNamed:@"menu.caf" waitForCompletion:NO]];
    
    SKTransition *reveal = [SKTransition revealWithDirection:SKTransitionDirectionDown duration:0.3];
    ChoosShipScene *choosScene = [[ChoosShipScene alloc]initWithSize:self.size];
    [self.scene.view presentScene:choosScene transition:reveal];
}
@end
