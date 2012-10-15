//
//  AboutLayer.m
//  TowerDefence
//
//  Created by xyxd mac on 12-10-12.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "AboutLayer.h"
#import "AboutViewController.h"
#import "HelloWorldLayer.h"
#import "TutorialScene.h"

@implementation AboutLayer

+ (id) scene
{
    CCScene *scene = [CCScene node];
    
    AboutLayer *about = [AboutLayer node];
    
    [scene addChild:about z:0];
    
    return scene;
}

- (id) init
{
    if (self = [super init]) {
        
        CGSize _winSize = [[CCDirector sharedDirector] winSize];
        _closeSprite = [CCSprite spriteWithFile:@"back_btn.png"];
		[_closeSprite setAnchorPoint:CGPointMake(1, 1)];
		[_closeSprite setPosition:CGPointMake(_winSize.width, _winSize.height)];
		[self addChild:_closeSprite];
        
        
        CCMenuItemImage *close1 = [CCMenuItemImage itemWithNormalImage:@"back_btn.png" selectedImage:@"buy.png" block:^(id sender){

            about = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
            about.aboutLayer = self;
            [[[CCDirector sharedDirector] view] addSubview:about.view];
            
            [self schedule:@selector(viewAddPointY) interval:0.3];
        }];
        
        CCMenuItemFont *hello = [CCMenuItemFont itemWithString:@"test" block:^(id sender){
           

            CCScene *scene = [Tutorial scene];
            

            
            [[CCDirector sharedDirector] runWithScene:scene];
        }];
        
        
        CCMenu *menu = [CCMenu menuWithItems:close1, hello,nil];
        
        [menu alignItemsVertically];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [menu setPosition:ccp( size.width/2, size.height/2)];
        
        
        [self addChild: menu z:-1];
        
        
        
        
        
    }
    
    return self;
}

- (void)dealloc
{
    [_closeSprite release];
    _closeSprite = nil;
    
    [super dealloc];
    
}

-(void)viewAddPointY{
    about.scrollView.contentOffset=ccpAdd(about.scrollView.contentOffset, ccp(0,0.5));//让UIScrollView显示内容每次慢慢向上移动0.5像素
    //view.scrollView.contentSize.height :得到UIScrollView的高度
    if(about.scrollView.contentOffset.y>=about.scrollView.contentSize.height){
        about.scrollView.contentOffset=ccp(0,-about.scrollView.frame.size.height);
    }
}

- (void) removeAboutView
{
    [about.view removeFromSuperview];
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}


@end
