//
//  AboutViewController.m
//  TowerDefence
//
//  Created by xyxd mac on 12-10-12.
//  Copyright (c) 2012年 XYXD.COM. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutLayer.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize scrollView;
@synthesize aboutLayer = _aboutLayer;

#pragma mark - view life circle
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
    // Do any additional setup after loading the view from its nib.
    //滚动view
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    //    scrollView.contentSize = CGSizeMake(100, 249);//设置滚动的可视区域
    scrollView.contentSize = scrollView.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [scrollView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [scrollView release];
    scrollView = nil;
    [self setScrollView:nil];
    [super viewDidUnload];
}

- (IBAction)btnClick:(id)sender {
    
    [self.aboutLayer removeAboutView];
    
}



@end
