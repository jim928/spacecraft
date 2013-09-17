//
//  CenterManager.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "CenterManager.h"

@interface CenterManager (){
    SKAction *playBGsound;
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
        
    }
    return self;
}

-(void)playmusic:(int)index{
    NSLog(@"************** play music :%d",index);
    NSString *filename = @"";
    if (index==1) {
        filename = @"flare.m4a";
    }
    if (index==2) {
        filename = @"waves.caf";
    }
    playBGsound = [SKAction repeatActionForever:[SKAction playSoundFileNamed:filename waitForCompletion:YES]];
    [self runAction:playBGsound];
}
@end
