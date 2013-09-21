//
//  SpawnManager.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-21.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "SpawnManager.h"

@interface SpawnManager (){
    int monsterNum;
}

@end

static SpawnManager *sharedInstance = nil;

@implementation SpawnManager

+(SpawnManager *)sharedInstance{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[SpawnManager alloc] init];
        }
    }
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        monsterNum = 0;
    }
    return self;
}

- (void)start{
    [self.delegate makeMonster];
    [self.delegate makeMonster];
    [self.delegate makeMonster];
    monsterNum = 3;
}

- (void)monsterDie{
    monsterNum--;
    if (monsterNum == 0) {
        [self runAction:[SKAction waitForDuration:1.0]];
        [self.delegate makeBoss];
    }
}

- (void)bossDie{
    [self runAction:[SKAction waitForDuration:1.0]];
    [self start];
}

@end
