//
//  PickMapScene.h
//  TowerDefence
//
//  Created by xyxd mac on 12-10-10.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "CCLayer.h"

#import "IntroViewController.h"



@interface PickMapLayer : CCLayer
{
    CGSize              _winSize;
    CCSprite            *_background;
    CCSprite            *_backSprite;
    
  
    
    IntroViewController *_introView;
}

@property (nonatomic, retain) IntroViewController *introView;
+ (id) scene;

@end




