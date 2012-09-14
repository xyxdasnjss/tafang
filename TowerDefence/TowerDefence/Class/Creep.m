//
//  Creep.m
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "Creep.h"

@implementation Creep
@synthesize hp = _curHp;
@synthesize moveDuration = _moveDuration;
@synthesize curWaypoint = _curWaypoint;



- (id) copyWithZone:(NSZone *)zone {
	Creep *copy = [[[self class] allocWithZone:zone] initWithCreep:self];
	return copy;
}

- (Creep *) initWithCreep:(Creep *) copyFrom {
    if ((self = [[[super init] initWithFile:@"Enemy1.png"] autorelease])) {
        self.hp = copyFrom.hp;
        self.moveDuration = copyFrom.moveDuration;
        self.curWaypoint = copyFrom.curWaypoint;
	}
	[self retain];
	return self;
}

- (WayPoint *)getCurrentWaypoint{
	
	DataModel *m = [DataModel getModel];
	
	WayPoint *waypoint = (WayPoint *) [m._waypoints objectAtIndex:self.curWaypoint];
	
	return waypoint;
}

- (WayPoint *)getNextWaypoint{
	
	DataModel *m = [DataModel getModel];
	int lastWaypoint = m._waypoints.count;
//    DLog(@"%d",lastWaypoint);
    
	self.curWaypoint++;
	
	if (self.curWaypoint >= lastWaypoint)
		self.curWaypoint = lastWaypoint - 1;
	

	WayPoint *waypoint = (WayPoint *) [m._waypoints objectAtIndex:self.curWaypoint];
	
	return waypoint;
}


@end

@implementation FastRedCreep

+ (id)creep {
    FastRedCreep *creep = nil;
    if ((creep = [[[super alloc] initWithFile:@"Enemy1.png"] autorelease])) {
        creep.hp = 10;
        creep.moveDuration = 4;
		creep.curWaypoint = 0;
    }
    return creep;
}

@end;

@implementation StrongGreenCreep

+ (id)creep {
    
    StrongGreenCreep *creep = nil;
    if ((creep = [[[super alloc] initWithFile:@"Enemy2.png"] autorelease])) {
        creep.hp = 20;
        creep.moveDuration = 9;
		creep.curWaypoint = 0;
    }
    return creep;
}

@end

