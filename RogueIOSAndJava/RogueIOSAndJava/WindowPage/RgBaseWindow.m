//
//  RgBaseWindow.m
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "RgBaseWindow.h"

@interface RgBaseWindow()

@property (nonatomic, strong) NSString *animationsKey;

@end

@implementation RgBaseWindow

- (void)setWindowAnimation:(RgWindowAnimations)windowAnimation {

    _windowAnimation = windowAnimation;
    
    if(windowAnimation == RgPresentAnimation)
    {
    
        self.windowLevel = 100;
    
    }
    else
    {
    
        self.windowLevel = 99;
    
    }

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    switch (_windowAnimation) {
        case RgAlphaAnimation:
        {
            
            if([_animationsKey isEqualToString:@"RgAlphaAnimation_show"])
            {
            
                if(_showComplete)
                {
                    
                    _showComplete();
                    
                }
                
            }
            else if([_animationsKey isEqualToString:@"RgAlphaAnimation_hide"])
            {
            
                if(_hideComplete)
                {
                    
                    _hideComplete();
                    
                }
            
            }
            
        }
            break;
        case RgPresentAnimation:
        {
            
            if([_animationsKey isEqualToString:@"RgPresentAnimation_show"])
            {
                
                if(_showComplete)
                {
                    
                    _showComplete();
                    
                }
                
            }
            else if([_animationsKey isEqualToString:@"RgPresentAnimation_hide"])
            {
                
                if(_hideComplete)
                {
                
                    _hideComplete();
                
                }
                
            }
            
        }
            break;
            
        default:
            break;
    }
    
    
    
}

- (void)removeWindowObjectForKey:(NSString *)aKey {

    if(![self.willNotRemoveWindows containsObject:aKey])
    {
    
        [self.windowKeyPath removeObjectForKey:aKey];
    
    }

}

- (void)doAnimation {
    
    if(!_isWindowShow)
    {
        
        switch (_windowAnimation) {
            case RgAlphaAnimation:
            {
                
                if(_isNeedAnimations)
                {
                
                    _animationsKey = @"RgAlphaAnimation_hide";
                
                }
                
            }
                break;
                
            case RgPresentAnimation: {
                
                if(_isNeedAnimations)
                {
                
                    _animationsKey = @"RgPresentAnimation_hide";
                    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"bounds"];
                    a.fillMode = kCAFillModeForwards;
                    a.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
                    a.toValue = [NSValue valueWithCGRect:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
                    a.duration = 0.3;
                    a.delegate = self;
                    [self.layer addAnimation:a forKey:@"RgPresentAnimation_hide"];
                
                }
                
            }
                break;
                
            default:
                break;
        }
        
    }
    else
    {

        [self makeKeyAndVisible];
        switch (_windowAnimation) {
            case RgAlphaAnimation:
            {
                
                if(_isNeedAnimations)
                {
                
                    _animationsKey = @"RgAlphaAnimation_show";
                    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"opacity"];
                    a.fillMode = kCAFillModeForwards;
                    a.fromValue = @(0.5);
                    a.toValue = @(1);
                    a.duration = 0.25;
                    a.delegate = self;
                    [self.layer addAnimation:a forKey:@"RgAlphaAnimation_show"];
                
                }
                
            }
                break;
                
            case RgPresentAnimation:
            {
                
                if(_isNeedAnimations)
                {
                
                    _animationsKey = @"RgPresentAnimation_show";
                    CABasicAnimation *a = [CABasicAnimation animationWithKeyPath:@"bounds"];
                    a.fillMode = kCAFillModeForwards;
                    a.fromValue = [NSValue valueWithCGRect:CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height)];
                    a.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
                    a.duration = 0.3;
                    a.delegate = self;
                    [self.layer addAnimation:a forKey:@"RgPresentAnimation_show"];
                
                }
                
            }
                break;
                
            default:
                break;
        }
        
    }

}


@end
