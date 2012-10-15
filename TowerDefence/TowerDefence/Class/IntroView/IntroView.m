//
//  IntroView.m
//  IOS_OBD_ARC
//
//  Created by 一峰 郝 on 12-7-31.
//  Copyright (c) 2012年 carsmart. All rights reserved.
//

#import "IntroView.h"
#import "IntroViewController.h"

@implementation IntroView


@synthesize image = _image;
@synthesize con = _con;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame withIntroViewController:(IntroViewController *)introCon andPageNumber:(int)page
{
    self = [super initWithFrame:frame];
    if (self) {
        _con=introCon;
        pageNumber=page;
        
        NSString *name = [NSString stringWithFormat:@"intro_%d",page];
        UIImage *img = [UIImage imageNamed:name];
        
        CGSize _winSize = [[CCDirector sharedDirector] winSize];

        
        
        _image = [UIButton buttonWithType:UIButtonTypeCustom];
        _image.frame = CGRectMake(
                                  (_winSize.width - kImageWidth) *.5,
                                  (_winSize.height - kImageHeight) *.5,
                                  kImageWidth,
                                  kImageHeight);
        
        [_image setImage:img forState:UIControlStateNormal];
        [_image setImage:img forState:UIControlStateHighlighted];
        [_image addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];

        
        [self addSubview:_image];

        
    }
    return self;
}

-(void)go:(id)sender
{
    [self.con swithToController];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
