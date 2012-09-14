//
//  Tutorial.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//


#import "Creep.h"
#import "WayPoint.h"
#import "Wave.h"

#import "Tower.h"

#import "GameHUD.h"

// Tutorial Layer
@interface Tutorial : CCLayer
{
	CCTMXTiledMap *_tileMap;
	CCTMXLayer *_background;
	int _currentLevel;
    GameHUD * gameHUD;
}

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;
@property (nonatomic, assign) int currentLevel;
+ (id) scene;
- (void)addWaypoint;
- (void)addTower: (CGPoint)pos;
- (BOOL) canBuildOnTilePosition:(CGPoint) pos;


@end
