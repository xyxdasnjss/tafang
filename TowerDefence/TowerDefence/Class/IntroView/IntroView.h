//
//  IntroView.h
//  IOS_OBD_ARC
//
//  Created by 一峰 郝 on 12-7-31.
//  Copyright (c) 2012年 carsmart. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IntroViewController;

#define kImageWidth     300
#define kImageHeight    190

@interface IntroView : UIView
{
    int pageNumber;
    UIButton *_image;
    IntroViewController *_con;
    

}


@property (retain, nonatomic) UIButton *image;
@property (retain, nonatomic) IntroViewController *con;


- (id)initWithFrame:(CGRect)frame withIntroViewController:(IntroViewController *)introCon andPageNumber:(int)page;
@end
