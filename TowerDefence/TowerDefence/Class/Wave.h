//
//  Wave.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "CCNode.h"

#import "Creep.h"

@interface Wave : CCNode {
	float _spawnRate;
	int _totalCreeps;
	Creep * _creepType;
}

@property (nonatomic) float spawnRate;
@property (nonatomic) int totalCreeps;
@property (nonatomic, retain) Creep *creepType;

- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate TotalCreeps:(int)totalcreeps;

@end