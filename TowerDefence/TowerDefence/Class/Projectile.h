//
//  Projectile.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-17.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "cocos2d.h"
#import "Tower.h"
#import "DataModel.h"

@interface Projectile : CCSprite {
    CCSprite *parentTower;
}
@property (nonatomic, assign) CCSprite *parentTower;
+ (id)projectile: (id) sender;

@end

@interface IceProjectile : Projectile {
}
+ (id)projectile: (id) sender;

@end

@interface CannonProjectile : Projectile {
}
+ (id)projectile: (id) sender;

@end
