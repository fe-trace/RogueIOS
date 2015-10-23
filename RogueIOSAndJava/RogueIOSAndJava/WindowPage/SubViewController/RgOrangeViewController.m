//
//  RgOrangeViewController.m
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "RgOrangeViewController.h"
#import "RgTotalWindow.h"

@interface RgOrangeViewController ()

@end

@implementation RgOrangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self buttons];
}

- (void)buttons {
    
    CGFloat width = 60;
    CGFloat widthSpace = (self.view.frame.size.width - 4 * width) / 5.0;
    
    UIButton *red = [UIButton buttonWithType:UIButtonTypeSystem];
    [red setTitle:@"红色" forState:UIControlStateNormal];
    red.backgroundColor = [UIColor whiteColor];
    [red setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    red.frame = CGRectMake(widthSpace * 1 + width * 0, 200, width, 50);
    [red addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:red];
    
    UIButton *blue = [UIButton buttonWithType:UIButtonTypeSystem];
    [blue setTitle:@"蓝色" forState:UIControlStateNormal];
    blue.backgroundColor = [UIColor whiteColor];
    [blue setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    blue.frame = CGRectMake(widthSpace * 2 + width * 1, 200, width, 50);
    [blue addTarget:self action:@selector(blueAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blue];
    
    UIButton *orange = [UIButton buttonWithType:UIButtonTypeSystem];
    [orange setTitle:@"橘色" forState:UIControlStateNormal];
    orange.backgroundColor = [UIColor whiteColor];
    [orange setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    orange.frame = CGRectMake(widthSpace * 3 + width * 2, 200, width, 50);
    [orange addTarget:self action:@selector(orangeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orange];
    
    UIButton *green = [UIButton buttonWithType:UIButtonTypeSystem];
    [green setTitle:@"绿色" forState:UIControlStateNormal];
    green.backgroundColor = [UIColor whiteColor];
    [green setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    green.frame = CGRectMake(widthSpace * 4 + width * 3, 200, width, 50);
    [green addTarget:self action:@selector(greenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:green];
    
    orange.hidden = YES;
    
    UIButton *get = [UIButton buttonWithType:UIButtonTypeSystem];
    [get setTitle:@"弹出" forState:UIControlStateNormal];
    get.backgroundColor = [UIColor blackColor];
    [get setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    get.frame = CGRectMake(20, 300, 280, 50);
    [get addTarget:self action:@selector(getAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:get];
    
}

- (void)getAction:(UIButton *)sender {
    
    [RgTotalWindow showBlueWindowWithAnimation:NO isNeedShowBlock:NO];
    [RgTotalWindow hideOrangeWindow];
    
    
}

- (void)redAction:(UIButton *)sender {
    
    [RgTotalWindow showRedWindowWithAnimation:YES isNeedShowBlock:YES];
    
}

- (void)blueAction:(UIButton *)sender {
    
    [RgTotalWindow showBlueWindowWithAnimation:YES isNeedShowBlock:YES];
    
}

- (void)orangeAction:(UIButton *)sender {
    
    [RgTotalWindow showOrangeWindowWithAnimation:YES isNeedShowBlock:YES];
    
}

- (void)greenAction:(UIButton *)sender {
    
    [RgTotalWindow showGreenWindowWithAnimation:YES isNeedShowBlock:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
