//
//  BaseAttributes.m
//  TowerDefenseTutorialPart7
//
//  Created by Aiden Fry on 01/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseAttributes.h"

@implementation BaseAttributes

@synthesize baseHealth = baseHealth;
@synthesize baseStartingMoney = baseStartingMoney;
@synthesize baseMoneyRegen = baseMoneyRegen;
@synthesize baseMoneyRegenRate = baseMoneyRegenRate;
@synthesize baseMoneyDropped = baseMoneyDropped;
@synthesize baseTowerCostPercentage = baseTowerCostPercentage;

@synthesize baseMGCost = baseMGCost;
@synthesize baseMGDamage = baseMGDamage;
@synthesize baseMGDamageRandom = baseMGDamageRandom;
@synthesize baseMGFireRate = baseMGFireRate;
@synthesize baseMGRange = baseMGRange;
@synthesize baseMGlvlup1 = baseMGlvlup1;
@synthesize baseMGlvlup2 = baseMGlvlup2;

@synthesize baseFCost = baseFCost;
@synthesize baseFDamage = baseFDamage;
@synthesize baseFDamageRandom = baseFDamageRandom;
@synthesize baseFFireRate = baseFFireRate;
@synthesize baseFFreezeDur = baseFFreezeDur;
@synthesize baseFRange = baseFRange;
@synthesize baseFlvlup1 = baseFlvlup1;
@synthesize baseFlvlup2 = baseFlvlup2;

@synthesize baseCCost = baseCCost;
@synthesize baseCDamage = baseCDamage;
@synthesize baseCDamageRandom = baseCDamageRandom;
@synthesize baseCFireRate = baseCFireRate;
@synthesize baseCSplashDist = baseCSplashDist;
@synthesize baseCRange = baseCRange;
@synthesize baseClvlup1 = baseClvlup1;
@synthesize baseClvlup2 = baseClvlup2;


@synthesize baseRedCreepHealth = baseRedCreepHealth;
@synthesize baseRedCreepMoveDur = baseRedCreepMoveDur;
@synthesize baseGreenCreepHealth = baseGreenCreepHealth;
@synthesize baseGreenCreepMoveDur = baseGreenCreepMoveDur;
@synthesize baseBrownCreepHealth = baseBrownCreepHealth;
@synthesize baseBrownCreepMoveDur = baseBrownCreepMoveDur;

static BaseAttributes *_sharedAttributes = nil;

+ (BaseAttributes *)sharedAttributes
{
	@synchronized([BaseAttributes class])
	{
		if (!_sharedAttributes)
			[[self alloc] init];
		return _sharedAttributes;
	}
	// to avoid compiler warning
	return nil;
}

+(id)alloc
{
	@synchronized([BaseAttributes class])
	{
		NSAssert(_sharedAttributes == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedAttributes = [super alloc];
		return _sharedAttributes;
	}
	// to avoid compiler warning
	return nil;
}


-(id) init
{
    if ((self=[super init]) ) {
		baseHealth = 100;
        
        baseStartingMoney = 2000;
        baseMoneyRegen = 5;// Affects how much money is regenerated naturally (per 5 seconds)
        baseMoneyRegenRate = 5.0;
        baseMoneyDropped = 8;//Affects how much money is dropped by a creep (maximum +1)
        baseTowerCostPercentage = 1; //Makes all towers cheaper/more expensive 1 = same, 0.5 = half etc.
        
        baseMGCost = 50;
        baseMGDamage = 2;//Damage (minimum)
        baseMGDamageRandom = 5;//Random amount for extra hit points
        baseMGFireRate = 0.25;
        baseMGRange = 200;
        baseMGlvlup1 = 300;
        baseMGlvlup2 = 450;
        
        baseFCost = 70;
        baseFDamage = 0;//Damage (minimum)
        baseFDamageRandom = 5;//Random amount for extra hit points
        baseFFireRate = 0.5;
        baseFFreezeDur = 1.5;//冰冻时间
        baseFRange = 150;//冰冻范围
        baseFlvlup1 = 50;
        baseFlvlup2 = 75;
        
        baseCCost = 120;
        baseCDamage = 20;//Damage (minimum)
        baseCDamageRandom = 20;//Random amount for extra hit points
        baseCFireRate = 0.75;
        baseCSplashDist = 75;
        baseCRange = 100;
        baseClvlup1 = 500;
        baseClvlup2 = 750;
        
        baseRedCreepHealth = 100;
        baseRedCreepMoveDur = 6;
        baseGreenCreepHealth = 150;
        baseGreenCreepMoveDur = 9;
        baseBrownCreepHealth = 500;
        baseBrownCreepMoveDur = 10;
        
    }
    
    
    return self;
}
@end
