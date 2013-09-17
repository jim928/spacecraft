//
//  CenterManager.h
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CenterManager : SKSpriteNode

+(CenterManager *)shareInstance;

-(void)playmusic:(int)index;

@end
