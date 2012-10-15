//
//  IntroViewController.m
//  IOS_OBD_ARC
//
//  Created by 一峰 郝 on 12-7-31.
//  Copyright (c) 2012年 carsmart. All rights reserved.
//

#import "IntroViewController.h"
#import "IntroView.h"

#import "TutorialScene.h"
#import "PickMapLayer.h"



static NSUInteger pages = 5;
@interface IntroViewController (PrivateMethods)
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
@end

@implementation IntroViewController

@synthesize scroll = _scroll;
@synthesize control = _control;
@synthesize viewsArray = _viewsArray;
@synthesize nextCon = _nextCon;
@synthesize pickMapLayer = _pickMapLayer;
@synthesize leftBtn = _leftBtn;
@synthesize rightBtn = _rightBtn;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSMutableArray *vs = [[NSMutableArray alloc] init];
    for (unsigned i=0; i<pages; i++) {
        [vs addObject:[NSNull null]];
    }
    self.viewsArray = vs;
    
    CGSize _winSize = [[CCDirector sharedDirector] winSize];
    
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _winSize.width, _winSize.height)];
    _scroll.pagingEnabled = YES;
    _scroll.contentSize = CGSizeMake(_winSize.width * pages, _winSize.height);
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = NO;
    _scroll.scrollsToTop = NO;
    _scroll.delegate = self;
    _scroll.userInteractionEnabled=YES;
    _scroll.backgroundColor=[UIColor grayColor];
    [self.view addSubview:_scroll];
    
    
    
    _control = [[UIPageControl alloc]init];
    _control.numberOfPages=pages;
    _control.currentPage=0;
    _control.center = CGPointMake((_winSize.width - 200) * .5 , _winSize.height - 30);
    _control.backgroundColor = [UIColor blueColor];
    [_control addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_control];
    
    pageControlUsed=NO;
    [self loadScrollViewWithPage:0];
    //    [self loadScrollViewWithPage:1];
    
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftImage = [UIImage imageNamed:@"left_arrow.png"];
    _leftBtn.frame = CGRectMake(5, (_winSize.height - leftImage.size.height) * .5, leftImage.size.width, leftImage.size.width);
    [_leftBtn setImage:leftImage forState:UIControlStateNormal];
    [_leftBtn setTag:kTagLeftBtn];
    [_leftBtn setHidden:YES];
    [_leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftBtn];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *rightImage = [UIImage imageNamed:@"right_arrow.png"];
    _rightBtn.frame = CGRectMake(_winSize.width - rightImage.size.width - 5, (_winSize.height - rightImage.size.height) * .5, rightImage.size.width, rightImage.size.width);
    [_rightBtn setTag:kTagRightBtn];
    [_rightBtn setImage:rightImage forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightBtn];
    
    
    


    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    //    DLog(@"-------scrollViewDidScroll------    %f",scroll.contentOffset.x);
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = _scroll.frame.size.width;
    int page = floor((_scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _control.currentPage = page;
    if (page == 0)
    {
        [_leftBtn setHidden:YES];
    }else
    {
        [_leftBtn setHidden:NO];
        [self loadScrollViewWithPage:page - 1];
    }
    
    if (page == (pages-1))
    {
        [_rightBtn setHidden:YES];
    }else
    {
        [_rightBtn setHidden:NO];
        [self loadScrollViewWithPage:page + 1];
    }
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}




- (void)loadScrollViewWithPage:(int)page
{
    
    if (page < 0)
        return;
    if (page >= pages)
        return;
    
    // replace the placeholder if necessary
    UIView *view = [_viewsArray objectAtIndex:page];
    if ((NSNull *)view == [NSNull null])
    {
        DLog(@"=============");
        view = [[IntroView alloc] initWithFrame:self.view.frame withIntroViewController:self andPageNumber:page];
        [_viewsArray replaceObjectAtIndex:page withObject:view];
        
        CGRect frame = self.view.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        view.frame = frame;
        [_scroll addSubview:view];
        
    }
    
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}



- (void)changePage:(id)sender
{
    
    int page = _control.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    if (page > 0) {
        [self loadScrollViewWithPage:page - 1];
    }
    if (page < (pages - 1)) {
        [self loadScrollViewWithPage:page + 1];
    }
    
    [self loadScrollViewWithPage:page];
    
    
	// update the scroll view to the appropriate page
    CGRect frame = _scroll.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [_scroll scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}


-(void)swithToController
{
    
    [self.pickMapLayer.introView.view removeFromSuperview];

//    DataModel *m = [DataModel getModel];
    // Run the intro Scene
    CCScene *scene = [Tutorial scene];

//    Tutorial *layer = (Tutorial *) [scene.children objectAtIndex:0];

//    UIPanGestureRecognizer *gestureRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:layer action:@selector(handlePanFrom:)] autorelease];
//    [[CCDirector sharedDirector].view addGestureRecognizer:gestureRecognizer];
//    m._gestureRecognizer = gestureRecognizer;

    [[CCDirector sharedDirector] replaceScene:scene];
    
    DLog(@"当前页面：%d",_control.currentPage);
    
    
    
}

- (void)btnClick:(UIButton*)sender
{
    int page;
    switch (sender.tag) {
        case kTagLeftBtn:
        {
            if (_control.currentPage < 0)
                return;
            
            page = _control.currentPage - 1;
            
        }break;
        case kTagRightBtn:
        {
            if (_control.currentPage >= pages)
                return;
            
            page = _control.currentPage + 1;
        }break;
            
    }
    
    _control.currentPage = page;
    
    if (page == 0)
    {
        [_leftBtn setHidden:YES];
    }else
    {
        [_leftBtn setHidden:NO];
        [self loadScrollViewWithPage:page - 1];
    }
    
    if (page == (pages-1))
    {
        [_rightBtn setHidden:YES];
    }else
    {
        [_rightBtn setHidden:NO];
        [self loadScrollViewWithPage:page + 1];
    }
    
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    
    [self loadScrollViewWithPage:page];
    
    
    // update the scroll view to the appropriate page
    CGRect frame = _scroll.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [_scroll scrollRectToVisible:frame animated:YES];
    
    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
    
    
    
}


@end
