//
//  Boss.h
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Boss : SKSpriteNode
@property (nonatomic)int hp;

-(id)initWithTexture:(SKTexture *)texture HP:(int)hpnum;

@end
