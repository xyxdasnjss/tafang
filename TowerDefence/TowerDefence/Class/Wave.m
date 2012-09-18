//
//  Wave.m
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "Wave.h"

@implementation Wave

@synthesize spawnRate = _spawnRate;
@synthesize redCreeps = _redCreeps;
@synthesize greenCreeps = _greenCreeps;
@synthesize brownCreeps = _brownCreeps;
@synthesize creepType = _creepType;

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

- (id) initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate RedCreeps:(int)redcreeps GreenCreeps: (int)greencreeps BrownCreeps: (int)browncreeps
{
	NSAssert(creep!=nil, @"Invalid creep for wave.");
    
	if( (self = [self init]) )
	{
		_creepType = creep;
		_spawnRate = spawnrate;
		_redCreeps = redcreeps;
        _greenCreeps = greencreeps;
        _brownCreeps = browncreeps;
        
	}
	return self;
}


@end
