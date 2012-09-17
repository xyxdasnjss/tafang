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
    
    int _redCreeps;
    int _greenCreeps;
}

@property (nonatomic) float spawnRate;
@property (nonatomic) int totalCreeps;
@property (nonatomic) int redCreeps;
@property (nonatomic) int greenCreeps;
@property (nonatomic, retain) Creep *creepType;

- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate TotalCreeps:(int)totalcreeps;
- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate RedCreeps:(int)redcreeps GreenCreeps:(int)greencreeps;


@end