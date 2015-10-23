//
//  RgTotalWindow.m
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "RgTotalWindow.h"
#import "RgRedWindow.h"
#import "RgBlueWindow.h"
#import "RgOrangeWindow.h"
#import "RgGreenWindow.h"
#import "RgRedViewController.h"
#import "RgBlueViewController.h"
#import "RgOrangeViewController.h"
#import "RgGreenViewController.h"

static RgTotalWindow *window = nil;

@interface RgTotalWindow()

@property (nonatomic, strong, readwrite) NSMutableDictionary *windowKeyPath;

@property (nonatomic, strong, readwrite) RgBaseWindow *recordCurrentWindow;

@end

@implementation RgTotalWindow

@synthesize recordCurrentWindow;
@synthesize windowKeyPath;

#pragma mark - 静态方法

+ (instancetype)shareInstanceWindowWillNotRemove:(NSArray *)parameters {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        window = [[RgTotalWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        window.willNotRemoveWindows = parameters;
        
    });
    
    return window;

}

+ (void)showRedWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {

    [window initWindowKeyPathAndShowWindow:object_getClassName([RgRedWindow class]) animation:isAnimation isNeedShowBlock:isBlock];
    
}

+ (void)showOrangeWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {
    
    [window initWindowKeyPathAndShowWindow:object_getClassName([RgOrangeWindow class]) animation:isAnimation isNeedShowBlock:isBlock];
    
}

+ (void)showBlueWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {

    [window initWindowKeyPathAndShowWindow:object_getClassName([RgBlueWindow class]) animation:isAnimation isNeedShowBlock:isBlock];
    
}

+ (void)showGreenWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {
    
    [window initWindowKeyPathAndShowWindow:object_getClassName([RgGreenWindow class]) animation:isAnimation isNeedShowBlock:isBlock];
    
}

+ (void)hideOrangeWindow {

    [window hideWindowKeyPath:object_getClassName([RgOrangeWindow class])];

}

- (RgBaseWindow *)getKeyWindow {
    
    return (RgBaseWindow *)[[UIApplication sharedApplication] keyWindow];

}

#pragma mark - 动态方法

- (void)hideWindowKeyPath:(const char *)name {

    NSString *className = [NSString stringWithUTF8String:name];
    
    [self hideWindowRootViewController:className];
    
}

- (void)hideWindowRootViewController:(NSString *)className {

    __weak RgTotalWindow *weakSelf = self;
    
    __weak RgBaseWindow *currentWindow = [weakSelf getKeyWindow];
    
    self.recordCurrentWindow.hideComplete = ^(void) {
    
        RgBaseWindow *changeWindow = weakSelf.recordCurrentWindow;
        changeWindow = nil;
        changeWindow = [weakSelf getKeyWindow];
        [weakSelf removeWindowObjectForKey:[NSString stringWithUTF8String:object_getClassName(changeWindow)]];
        weakSelf.recordCurrentWindow = changeWindow;
    
    };
    
    if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgOrangeWindow class])]])
    {
    
        currentWindow = (RgOrangeWindow *)self.recordCurrentWindow;
        currentWindow.isWindowShow = NO;
        [currentWindow doAnimation];
        
    }

}

- (void)initWindowKeyPathAndShowWindow:(const char *)name animation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {

    NSString *className = [NSString stringWithUTF8String:name];
    
    [self initWindowRootViewController:className animation:isAnimation isNeedShowBlock:isBlock];

}

- (void)initWindowRootViewController:(NSString *)className animation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock {
    
    if(!self.windowKeyPath)
    {
        
        self.windowKeyPath = [NSMutableDictionary new];
        
    }
    
    __weak RgBaseWindow *currentWindow = nil;
    RgBaseWindow *objectWindow = [self.windowKeyPath objectForKey:className];
    
    if(!objectWindow)
    {
        
        Class WindowClass = NSClassFromString(className);
        objectWindow = [[WindowClass alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgRedWindow class])]])
        {
            
            RgRedViewController *red = [RgRedViewController new];
            currentWindow = (RgRedWindow *)objectWindow;
            currentWindow.rootViewController = red;
            objectWindow.windowAnimation = RgAlphaAnimation;
            
            if(isBlock)
            {
            
                __weak RgTotalWindow *weakSelf = self;
                objectWindow.showComplete = ^(void) {
                    
                    [weakSelf removeWindowObjectForKey:className];
                    weakSelf.recordCurrentWindow = currentWindow;
                    [weakSelf makeWillNotRemoveAlphaZero];
                    
                };
            
            }
            
            objectWindow.isWindowShow = YES;
            objectWindow.isNeedAnimations = isAnimation;
            [currentWindow doAnimation];
            
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgBlueWindow class])]])
        {
            
            RgBlueViewController *blue = [RgBlueViewController new];
            currentWindow = (RgBlueWindow *)objectWindow;
            currentWindow.rootViewController = blue;
            objectWindow.windowAnimation = RgAlphaAnimation;
            
            if(isBlock)
            {
            
                __weak RgTotalWindow *weakSelf = self;
                objectWindow.showComplete = ^(void) {
                    
                    [weakSelf removeWindowObjectForKey:className];
                    weakSelf.recordCurrentWindow = currentWindow;
                    [weakSelf makeWillNotRemoveAlphaZero];
                    
                };
            
            }
            
            objectWindow.isWindowShow = YES;
            objectWindow.isNeedAnimations = isAnimation;
            [currentWindow doAnimation];
            
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgOrangeWindow class])]])
        {
            
            RgOrangeViewController *orange = [RgOrangeViewController new];
            currentWindow = (RgOrangeWindow *)objectWindow;
            currentWindow.rootViewController = orange;
            objectWindow.windowAnimation = RgPresentAnimation;
            
            if(isBlock)
            {
            
                __weak RgTotalWindow *weakSelf = self;
                objectWindow.showComplete = ^(void) {
                    
                    [weakSelf removeWindowObjectForKey:className];
                    weakSelf.recordCurrentWindow = currentWindow;
                    [weakSelf makeWillNotRemoveAlphaZero];
                    
                };
            
            }

            objectWindow.isWindowShow = YES;
            objectWindow.isNeedAnimations = isAnimation;
            [currentWindow doAnimation];
            
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgGreenWindow class])]])
        {
            
            RgGreenViewController *green = [RgGreenViewController new];
            currentWindow = (RgGreenWindow *)objectWindow;
            currentWindow.rootViewController = green;
            objectWindow.windowAnimation = RgAlphaAnimation;
            
            if(isBlock)
            {
            
                __weak RgTotalWindow *weakSelf = self;
                objectWindow.showComplete = ^(void) {
                    
                    [weakSelf removeWindowObjectForKey:className];
                    weakSelf.recordCurrentWindow = currentWindow;
                    [weakSelf makeWillNotRemoveAlphaZero];
                    
                };
            
            }
            
            objectWindow.isWindowShow = YES;
            objectWindow.isNeedAnimations = isAnimation;
            [currentWindow doAnimation];
            
        }
        
        [self.windowKeyPath setObject:currentWindow forKey:className];
        
    }
    else
    {
    
        if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgRedWindow class])]])
        {
        
            currentWindow = (RgRedWindow *)objectWindow;
        
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgBlueWindow class])]])
        {
            
            currentWindow = (RgBlueWindow *)objectWindow;
            
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgOrangeWindow class])]])
        {
            
            currentWindow = (RgOrangeWindow *)objectWindow;
            
        }
        else if([className isEqualToString:[NSString stringWithUTF8String:object_getClassName([RgGreenWindow class])]])
        {
            
            currentWindow = (RgGreenWindow *)objectWindow;
            [currentWindow doAnimation];
            
        }
    
    }
    
}

#pragma mark - 每次跳转 window 的时候，让不会被移除的 window 隐藏，避免闪界面

- (void)makeWillNotRemoveAlphaZero {

    for(NSString *className in self.willNotRemoveWindows)
    {
        
        if(self.recordCurrentWindow != [self.windowKeyPath objectForKey:className])
        {
        
            RgBaseWindow *needHiddenWindow = [self.windowKeyPath objectForKey:className];
            if(needHiddenWindow)
            {
                
                needHiddenWindow.hidden = YES;
                
            }
        
        }

    }
    
}

@end
