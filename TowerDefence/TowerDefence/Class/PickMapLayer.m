//
//  PickMapScene.m
//  TowerDefence
//
//  Created by xyxd mac on 12-10-10.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "PickMapLayer.h"




@implementation PickMapLayer

@synthesize introView = _introView;


+ (id) scene
{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PickMapLayer *layer = [PickMapLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer z:0];

	
	// return the scene
	return scene;

}

-(id) init
{
    if(self = [super init])
    {
        self.isTouchEnabled = YES;
        
        _winSize		= [[CCDirector sharedDirector] winSize];
        
        
        
        _backSprite = [CCSprite spriteWithFile:@"back_btn.png"];
		[_backSprite setAnchorPoint:CGPointMake(1, 1)];
		[_backSprite setPosition:CGPointMake(_winSize.width, _winSize.height)];
		[self addChild:_backSprite];
		
        

        
        _introView = [[IntroViewController alloc]init];
        _introView.pickMapLayer = self;
        [[[CCDirector sharedDirector] view] addSubview:_introView.view];

        
    }
    return self;
}







-(void) dealloc
{
    
    [super dealloc];
}


@end

