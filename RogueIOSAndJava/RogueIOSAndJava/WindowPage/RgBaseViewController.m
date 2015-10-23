//
//  RgBaseViewController.m
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "RgBaseViewController.h"

@interface RgBaseViewController ()

@end

@implementation RgBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {

    NSLog(@"当前类别dealloc     %@", [NSString stringWithUTF8String:object_getClassName(self)]);
    
}

@end
