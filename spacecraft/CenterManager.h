//
//  CenterManager.h
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t heroBulletCategory   = 0x1 << 0;
static const uint32_t monsterBulletCategory= 0x1 << 1;
static const uint32_t heroCategory         = 0x1 << 2;
static const uint32_t monsterCategory      = 0x1 << 3;

@interface CenterManager : SKSpriteNode

//texture
@property (nonatomic) SKTexture *heroTexture;
@property (nonatomic) SKTexture *bossTexture;
@property (nonatomic) SKTexture *monsterTexture;
@property (nonatomic) SKTexture *bulletTexture;

//move speed
@property (nonatomic) CGFloat bulletSpeed;

+(CenterManager *)shareInstance;

-(void)playBGmusic:(int)index;

@end
