//
//  TowerMenuLayer.m
//  TowerDefence
//
//  Created by xyxd mac on 12-9-24.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "TowerMenuLayer.h"



@implementation TowerMenuLayer

@synthesize selSpriteRange = _selSpriteRange;
@synthesize towerMenu = _towerMenu;
@synthesize sellMenu = _sellMenu;
@synthesize updateMenu = _updateMenu;

static TowerMenuLayer *_towerMenuLayer = nil;

//+ (TowerMenuLayer *)sharedMenu:(CCSprite*)sprite
//{
//	@synchronized([TowerMenuLayer class])
//	{
//		if (!_towerMenuLayer)
//			[[self alloc] init:sprite];
//		return _towerMenuLayer;
//	}
//	// to avoid compiler warning
//	return nil;
//}

+(id)alloc
{
	@synchronized([TowerMenuLayer class])
	{
//		NSAssert(_towerMenuLayer == nil, @"Attempted to allocate a second instance of a singleton.");
        if (_towerMenuLayer == nil) {
            _towerMenuLayer = [super alloc];
        }
		
		return _towerMenuLayer;
	}
	// to avoid compiler warning
	return nil;
}

- (id)init:(CCSprite*)sprite
{
    if ((self = [super init])) {
        
        if (sprite != nil) {
            if (_selSpriteRange != nil) {
                [self removeChild:_selSpriteRange cleanup:YES];
                _selSpriteRange = nil;
            }
            _selSpriteRange = [CCSprite spriteWithFile:@"Range.png"];
            
            DLog(@"tag:%d,%f,%f",sprite.tag,sprite.position.x,sprite.position.y);
            baseAttributes = [BaseAttributes sharedAttributes];
            switch (sprite.tag) {
                case 1:
                    _selSpriteRange.scale = (baseAttributes.baseMGRange/50);
                    break;
                case 2:
                    _selSpriteRange.scale = (baseAttributes.baseFRange/50);
                    break;
                case 3:
                    _selSpriteRange.scale = (baseAttributes.baseCRange/50);
                    break;
                default:
                    break;
            }
            [self addChild:_selSpriteRange z:3];
            _selSpriteRange.position = sprite.position;
//            DLog(@"%f,%f",_selSpriteRange.position.x,_selSpriteRange.position.y);
            
            _updateMenu = [CCMenuItemImage itemWithNormalImage:@"Buy.png" selectedImage:@"Cancel.png" target:self selector:@selector(update)];
            
            _sellMenu = [CCMenuItemImage itemWithNormalImage:@"Cancel.png" selectedImage:@"Buy.png" target:self selector:@selector(sell)];
            
            CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"开始" block:^(id sender) {
                
                DLog(@"menu1");
               [[[CCDirector sharedDirector] scheduler] setTimeScale:1];
                
            }];
            
            _towerMenu = [CCMenu menuWithItems: _updateMenu, _sellMenu,itemAchievement, nil];
            
            _towerMenu.position = ccp((sprite.position.x/2 + 50), (sprite.position.y/2-22));

            [_towerMenu alignItemsHorizontallyWithPadding:5.0f];

            [self addChild:_towerMenu z:3];
            
        }else{
            [self.towerMenu removeAllChildrenWithCleanup:YES];
            _towerMenu = nil;
            
            [self removeChild:_selSpriteRange cleanup:YES];
            _selSpriteRange = nil;
        }

        
        

        
        
    }
    return self;
}



- (void)update
{
    DLog(@"update");
   
    
    [[[CCDirector sharedDirector] scheduler] setTimeScale:2];
   
}

- (void)sell
{
    DLog(@"sell");
  [[[CCDirector sharedDirector] scheduler] setTimeScale:0.5];
}

-(void)dealloc
{
    DLog(@"dealloc MenuTower");
    [super dealloc];
}

@end
