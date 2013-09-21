//
//  SpawnManager.h
//  spacecraft
//
//  Created by 湛奇 on 13-9-21.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SpawnManagerDelegate;

@interface SpawnManager : SKSpriteNode

@property (nonatomic)id<SpawnManagerDelegate> delegate;
+(SpawnManager *)sharedInstance;

-(void)start;
-(void)monsterDie;
-(void)bossDie;
@end


@protocol SpawnManagerDelegate <NSObject>

@optional
-(void)makeMonster;
-(void)makeBoss;
@end