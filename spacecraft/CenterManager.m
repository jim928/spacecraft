//
//  CenterManager.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "CenterManager.h"

@interface CenterManager (){
}

@end

static CenterManager *sharedInstance = nil;

@implementation CenterManager

+(CenterManager *)shareInstance{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[CenterManager alloc] init];
        }
    }
    return sharedInstance;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.heroTexture = [SKTexture textureWithImageNamed:@"corsair"];
        self.bossTexture = [SKTexture textureWithImageNamed:@"boss"];
        self.monsterTexture = [SKTexture textureWithImageNamed:@"monster"];
        self.bulletTexture = [SKTexture textureWithImageNamed:@"bullet"];
        
        self.bulletSpeed = 400.0;   //moves by xxx pix per second
    }
    return self;
}

- (void)playBGmusic:(int)index{
    NSLog(@"************** play index :%d",index);
    if (index==1) {
        [self runAction:[SKAction playSoundFileNamed:@"flare.m4a" waitForCompletion:NO] withKey:@"bgMusic"];
    }else{
        [self runAction:[SKAction playSoundFileNamed:@"waves.caf" waitForCompletion:NO] withKey:@"bgMusic"];

    }
}

@end
