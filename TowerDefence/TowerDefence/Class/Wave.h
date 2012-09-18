//
//  Wave.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "Creep.h"

@interface Wave : CCNode {
	float _spawnRate;
	int _redCreeps;
    int _greenCreeps;
    int _brownCreeps;
    
	Creep * _creepType;
}

@property (nonatomic) float spawnRate;
@property (nonatomic) int redCreeps;
@property (nonatomic) int greenCreeps;
@property (nonatomic) int brownCreeps;

@property (nonatomic, retain) Creep *creepType;

- (id) initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate RedCreeps:(int)redcreeps GreenCreeps: (int)greencreeps BrownCreeps: (int)browncreeps;

@end