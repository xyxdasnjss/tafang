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
#define kZTower             3

// Tutorial Layer
@interface Tutorial : CCLayer<MyTowerDelegate>
{
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
	
	int _currentLevel;
	
	GameHUD * gameHUD;//底部菜单
    BaseAttributes * baseAttributes;
    
    CCSprite * _selSpriteRange;//点击地图上的塔，显示的范围
}

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;

@property (nonatomic, assign) int currentLevel;
@property (nonatomic, retain) CCSprite *selSpriteRange;

+ (id) scene;
- (void)addWaypoint;
- (void)addTower: (CGPoint)pos tag:(int)towerTag;
- (BOOL) canBuildOnTilePosition:(CGPoint) pos;
+(void) resetGame;
-(void) resetLayer;
-(void) loadMenu;
@end
