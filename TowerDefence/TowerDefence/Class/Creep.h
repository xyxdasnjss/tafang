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

@interface Creep : CCSprite <NSCopying>  {
    int _curHp;
	int _moveDuration;
	int _curWaypoint;
}

@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int moveDuration;
@property (nonatomic, assign) int curWaypoint;

- (Creep *) initWithCreep:(Creep *) copyFrom;
- (WayPoint *)getCurrentWaypoint;
- (WayPoint *)getNextWaypoint;

@end

@interface FastRedCreep : Creep {
}
+(id)creep;
@end

@interface StrongGreenCreep : Creep {
}
+(id)creep;
@end
