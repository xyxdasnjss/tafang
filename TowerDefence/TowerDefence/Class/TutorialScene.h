//
//  Tutorial.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//



#import "Creep.h"
#import "Projectile.h"
#import "Tower.h"
#import "WayPoint.h"
#import "Wave.h"
#import "baseAttributes.h"
#import "GameHUD.h"
#import "EndGame.h"
#import "MenuLayer.h"


#define kZTutorial          1
#define kZGameHUD           2
#define kZMenuLayer         10
#define kZTileMap           0

// Tutorial Layer
@interface Tutorial : CCLayer
{
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
	
	int _currentLevel;
	
	GameHUD * gameHUD;//底部菜单
    BaseAttributes * baseAttributes;
    
}

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;

@property (nonatomic, assign) int currentLevel;

+ (id) scene;
- (void)addWaypoint;
- (void)addTower: (CGPoint)pos tag:(int)towerTag;
- (BOOL) canBuildOnTilePosition:(CGPoint) pos;
+(void) resetGame;
-(void) resetLayer;
-(void) loadMenu;
@end
