//
//  ViewController.m
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/10.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "ViewController.h"
#import "RgTotalWindow.h"
#import "RgGreenWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [RgTotalWindow showRedWindowWithAnimation:YES isNeedShowBlock:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
