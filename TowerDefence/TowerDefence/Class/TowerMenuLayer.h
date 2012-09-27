//
//  TowerMenuLayer.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-24.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "CCLayer.h"

#import "BaseAttributes.h"

@interface TowerMenuLayer : CCLayer
{
    CCSprite *_selSpriteRange;
    CCMenu *_towerMenu;
    CCMenuItem *_sellMenu;
    CCMenuItem *_updateMenu;
    
    BaseAttributes * baseAttributes;
}

@property (nonatomic, retain) CCSprite *selSpriteRange;
@property (nonatomic, retain) CCMenu *towerMenu;
@property (nonatomic, retain) CCMenuItem *sellMenu;
@property (nonatomic, retain) CCMenuItem *updateMenu;

- (id)init:(CCSprite*)sprite;
@end
