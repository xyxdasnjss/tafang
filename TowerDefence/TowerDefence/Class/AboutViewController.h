//
//  AboutViewController.h
//  TowerDefence
//
//  Created by xyxd mac on 12-10-12.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AboutLayer;

@interface AboutViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    AboutLayer *_aboutLayer;
}
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) AboutLayer *aboutLayer;

@end
