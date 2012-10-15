//
//  AboutLayer.h
//  TowerDefence
//
//  Created by xyxd mac on 12-10-12.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "CCLayer.h"
@class AboutViewController;

@interface AboutLayer : CCLayer
{
    CCSprite *_closeSprite;
    AboutViewController *about;
}

+ (id) scene;
- (void) removeAboutView;
@end
