//
//  RgBaseWindow.h
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  动画类型
 */
typedef NS_ENUM(NSInteger, RgWindowAnimations){
    /**
     *  从下而上弹出动画
     */
    RgPresentAnimation = 0,
    /**
     *  渐隐动画
     */
    RgAlphaAnimation   = 1,
};

@interface RgBaseWindow : UIWindow

/**
 *  用来记录被字典类型记录的 window 的值和key
 */

@property (nonatomic, strong, readonly) NSMutableDictionary *windowKeyPath;

/**
 *  当成功跳转到某一个界面后，就要记录当前的 临时值，并且把以前的值覆盖掉
 */

@property (nonatomic, strong, readonly) UIWindow *recordCurrentWindow;

/**
 *  每次显示 window 的时候，使用这个布尔类型的值来代替 makeKeyAndVisible，再出现或者消失的时候必须使用
 */

@property (nonatomic, assign) BOOL isWindowShow;

@property (nonatomic, assign) BOOL isNeedAnimations;

/**
 *  定义 window消失或者出现动画的类型
 */

@property (nonatomic, assign) RgWindowAnimations windowAnimation;

/**
 *  window 出现完成后执行的动作
 */

@property (nonatomic, strong) void(^showComplete)(void);

/**
 *  window 消失后执行的动作
 */

@property (nonatomic, strong) void(^hideComplete)(void);

/**
 *  原本是每次点击下一个 window ，那么上一个 window 就被从临时 window里被抹除， 但是如果需要保留上一个 window，就需要自己定义哪个类型的 window 不会被抹除，那么点击下一个window 的时候，这个类型的 window 不会被抹除而会一直存在程序中
 */

@property (nonatomic, strong) NSArray *willNotRemoveWindows;

/**
 *  使用这个方法来删除 windowKeyPath 对应的值
 *
 *  @param aKey 键
 */

- (void)removeWindowObjectForKey:(NSString *)aKey;

/**
 *  提交执行动作
 */

- (void)doAnimation;

@end
