//
//  FightScene.m
//  spacecraft
//
//  Created by 湛奇 on 13-9-17.
//  Copyright (c) 2013年 湛奇. All rights reserved.
//

#import "FightScene.h"
#import "Player.h"
#import "Monster.h"
#import "Boss.h"

@interface FightScene (){
    Player *pship;
    CGPoint touchposition;
    CGPoint myposition;
    
    
}

@end

@implementation FightScene
-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        
        [self runAction:[SKAction repeatActionForever:[SKAction playSoundFileNamed:@"waves.caf" waitForCompletion:YES]] withKey:@"bgMusic"];
        
        pship = [[Player alloc]initWithTexture:[CenterManager shareInstance].heroTexture HP:100];
        pship.size = CGSizeMake(50, 50);
        pship.position = CGPointMake(CGRectGetMidX(self.frame), 25);
        SKAction *action = [SKAction sequence:@[[SKAction performSelector:@selector(heroShot) onTarget:self],[SKAction waitForDuration:0.3]]];
        [pship runAction:[SKAction repeatActionForever:action]];
        [self addChild:pship];
        
        [SpawnManager sharedInstance].delegate = self;
        [[SpawnManager sharedInstance]start];
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint location;
    for (UITouch *touch in touches) {
        location = [touch locationInNode:self];
    }
    touchposition = location;
    myposition = pship.position;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint location;
    for (UITouch *touch in touches) {
        location = [touch locationInNode:self];
    }
    float x = location.x - touchposition.x;
    float y = location.y - touchposition.y;
    if (myposition.x+x<0||myposition.x+x>self.frame.size.width) {
        return;
    }
    if (myposition.y+y<0||myposition.y+y>self.frame.size.height) {
        return;
    }
    pship.position = CGPointMake(myposition.x+x, myposition.y+y);
}
- (void)didBeginContact:(SKPhysicsContact *)contact{
    
    SKPhysicsBody *bulletBody,*shipBody;
    if (contact.bodyA.categoryBitMask<contact.bodyB.categoryBitMask) {
        shipBody = contact.bodyB;
        bulletBody = contact.bodyA;
    }else{
        shipBody = contact.bodyA;
        bulletBody = contact.bodyB;
    }
    
    if (bulletBody.categoryBitMask==heroBulletCategory&&shipBody.categoryBitMask==monsterCategory) {
        [bulletBody.node removeFromParent];
        [self shipbeShot:shipBody];
    }
    if (bulletBody.categoryBitMask==monsterCategory&&shipBody.categoryBitMask==heroBulletCategory) {
        [bulletBody.node removeFromParent];
        [self shipbeShot:shipBody];
    }
}
-(void)heroShot{
    SKSpriteNode *bullet = [SKSpriteNode spriteNodeWithTexture:[CenterManager shareInstance].bulletTexture size:CGSizeMake(20, 20)];
    bullet.position = CGPointMake(pship.position.x, pship.position.y+25);
    bullet.name = @"bullet";
    bullet.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1, 1)];
//    bullet.physicsBody.dynamic = NO;
    bullet.physicsBody.categoryBitMask = heroBulletCategory;
    bullet.physicsBody.contactTestBitMask = monsterCategory;
    [self addChild:bullet];
    [bullet runAction:[SKAction moveToY:CGRectGetHeight(self.frame)+10 duration:[self timeFrom:bullet.position]]completion:^{
        [bullet removeFromParent];
    }];
    [self runAction:[SKAction playSoundFileNamed:@"herofire.caf" waitForCompletion:NO]];
}
-(NSTimeInterval)timeFrom:(CGPoint)position1{
    CGFloat range = self.frame.size.height-position1.y;
    return range/[CenterManager shareInstance].bulletSpeed;
}
- (void)shipbeShot:(SKPhysicsBody *)body{
    if ([body.node.name isEqualToString:@"player"]) {
        pship.hp = pship.hp-1;
        if (pship.hp<=0) {
            [pship removeFromParent];
            [self runAction:[SKAction playSoundFileNamed:@"explosion.wav" waitForCompletion:NO]];
        }
    }
    if ([body.node.name isEqualToString:@"monster"]) {
        Monster *monster = (Monster *)body.node;
        monster.hp = monster.hp-1;
        if (monster.hp<=0) {
            [monster removeFromParent];
            [[SpawnManager sharedInstance]monsterDie];
            [self runAction:[SKAction playSoundFileNamed:@"explosion.wav" waitForCompletion:NO]];
        }
    }
    if ([body.node.name isEqualToString:@"boss"]) {
        Boss *aboss = (Boss *)body.node;
        aboss.hp = aboss.hp-1;
        if (aboss.hp<=0) {
            [aboss removeFromParent];
            [[SpawnManager sharedInstance]bossDie];
            [self runAction:[SKAction playSoundFileNamed:@"explosion.wav" waitForCompletion:NO]];
        }
    }
}
- (void)createMonster{
    Monster *amon = [[Monster alloc]initWithTexture:[CenterManager shareInstance].monsterTexture HP:1];
    amon.name = @"monster";
    amon.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:amon.size];
    amon.physicsBody.dynamic = NO;
    amon.physicsBody.categoryBitMask = monsterCategory;
    amon.physicsBody.contactTestBitMask = heroBulletCategory;
    amon.position = CGPointMake((amon.size.width/2+arc4random()%((int)CGRectGetWidth(self.frame)-(int)amon.size.width)), CGRectGetHeight(self.frame)+amon.size.height/2);
    [self addChild:amon];
    
    [amon runAction:[SKAction moveByX:0 y:-100 duration:0.5]];
}
- (void)createBoss{
    Boss *aboss = [[Boss alloc]initWithTexture:[CenterManager shareInstance].bossTexture HP:10];
    aboss.name = @"boss";
    aboss.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100, 3)];
    aboss.physicsBody.dynamic = NO;
    aboss.physicsBody.categoryBitMask = monsterCategory;
    aboss.physicsBody.contactTestBitMask = heroBulletCategory;
    aboss.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetHeight(self.frame)-aboss.size.height/2);
    [self addChild:aboss];
    
    [aboss runAction:[SKAction moveByX:0 y:-100 duration:0.5]];
}
#pragma mark- SparnManagerDelegate
- (void)makeMonster{
    [self createMonster];
}
- (void)makeBoss{
    [self createBoss];
}

@end
