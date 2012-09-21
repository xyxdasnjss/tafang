//
//  DataModel.h
//  TowerDefence
//
//  Created by xyxd mac on 12-9-13.
//
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

@interface DataModel : NSObject <NSCoding> {
	CCLayer *_gameLayer;
	CCLayer *_gameHUDLayer;
	
	NSMutableArray *_projectiles;//子弹
	NSMutableArray *_towers;//我们自己
	NSMutableArray *_targets;//敌人
	NSMutableArray *_waypoints;
	
	NSMutableArray *_waves;
	
	UIPanGestureRecognizer *_gestureRecognizer;
}

@property (nonatomic, retain) CCLayer *_gameLayer;
@property (nonatomic, retain) CCLayer *_gameHUDLayer;

@property (nonatomic, retain) NSMutableArray * _projectiles;
@property (nonatomic, retain) NSMutableArray * _towers;
@property (nonatomic, retain) NSMutableArray * _targets;
@property (nonatomic, retain) NSMutableArray * _waypoints;

@property (nonatomic, retain) NSMutableArray * _waves;

@property (nonatomic, retain) UIPanGestureRecognizer *_gestureRecognizer;;
+ (DataModel*)getModel;




@end
