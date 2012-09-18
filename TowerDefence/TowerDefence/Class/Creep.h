//
//  Creep.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "CCSprite.h"

#import "DataModel.h"
#import "WayPoint.h"
#import "GameHUD.h"

@interface Creep : CCSprite <NSCopying> {
    int _curHp;
    int _totalHp;
	int _moveDuration;
	
	int _curWaypoint;
    int _lastWaypoint;
    float firstDistance;
    
    GameHUD * gameHUD;
    CCProgressTimer *healthBar;
    
}

@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int moveDuration;
@property (nonatomic, assign) int totalHp;

@property (nonatomic, assign) int curWaypoint;
@property (nonatomic, assign) int lastWaypoint;

@property (nonatomic,retain) CCProgressTimer *healthBar;


- (Creep *) initWithCreep:(Creep *) copyFrom;
- (WayPoint *)getCurrentWaypoint;
- (WayPoint *)getNextWaypoint;
- (WayPoint *)getLastWaypoint;
- (float) moveDurScale;


@end

@interface FastRedCreep : Creep {
}
+(id)creep;
@end

@interface StrongGreenCreep : Creep {
}
+(id)creep;
@end

@interface BossBrownCreep : Creep {
}
+(id)creep;
@end
