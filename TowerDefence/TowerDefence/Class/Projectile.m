//
//  Projectile.m
//  TowerDefence
//
//  Created by xyxd mac on 12-9-17.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile


+ (id)projectile {
    Projectile *projectile = nil;
    if ((projectile = [[[super alloc] initWithFile:@"Projectile.png"] autorelease])) {
        
    }
    return projectile;
}

- (void) dealloc
{
    [super dealloc];
}

@end
