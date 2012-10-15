//
//  IntroViewController.h
//  IOS_OBD_ARC
//
//  Created by 一峰 郝 on 12-7-31.
//  Copyright (c) 2012年 carsmart. All rights reserved.
//

@protocol ControllerSwitcher <NSObject>

-(void)swithToController;

@end
#import <UIKit/UIKit.h>
@class PickMapLayer;


#define kTagLeftBtn     1001
#define kTagRightBtn    1002
@interface IntroViewController : UIViewController<UIScrollViewDelegate,ControllerSwitcher>
{
    UIScrollView *_scroll;
    UIPageControl *_control;
    NSMutableArray *_viewsArray;
    BOOL pageControlUsed;
    UIViewController *_nextCon;
    PickMapLayer *_pickMapLayer;
    
    UIButton *_leftBtn;
    UIButton *_rightBtn;
}


@property(retain,nonatomic) UIScrollView *scroll;
@property(retain,nonatomic) UIPageControl *control;
@property(retain,nonatomic) NSMutableArray *viewsArray;
@property(retain,nonatomic) UIViewController *nextCon;
@property(retain,nonatomic) PickMapLayer *pickMapLayer;
@property (nonatomic, retain) UIButton *leftBtn;
@property (nonatomic, retain) UIButton *rightBtn;

@end
