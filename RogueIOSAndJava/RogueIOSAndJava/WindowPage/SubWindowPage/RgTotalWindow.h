//
//  RgTotalWindow.h
//  RogueIOSAndJava
//
//  Created by Rogue on 15/10/19.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "RgBaseWindow.h"

@interface RgTotalWindow : RgBaseWindow

/**
 *  单利
 *
 *  @param parameters 不会被移除的 window
 *
 *  @return 单利
 */

+ (instancetype)shareInstanceWindowWillNotRemove:(NSArray *)parameters;

/**
 *  显示红色 window
 *
 *  @param isAnimation 是否需要动画
 *  @param isBlock     是否需要block
 */

+ (void)showRedWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock;

/**
 *  显示橘色 window
 *
 *  @param isAnimation 是否需要动画
 *  @param isBlock     是否需要block
 */

+ (void)showOrangeWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock;

/**
 *  显示蓝色 window
 *
 *  @param isAnimation 是否需要动画
 *  @param isBlock     是否需要block
 */

+ (void)showBlueWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock;

/**
 *  显示绿色 window
 *
 *  @param isAnimation 是否需要动画
 *  @param isBlock     是否需要block
 */

+ (void)showGreenWindowWithAnimation:(BOOL)isAnimation isNeedShowBlock:(BOOL)isBlock;



+ (void)hideOrangeWindow;

/**
 *  获取当前的 window
 *
 *  @return 当前 window
 */

- (RgBaseWindow *)getKeyWindow;

@end
