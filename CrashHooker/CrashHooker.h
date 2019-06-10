//
//  CrashHooker.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

//category
#import "NSObject+CrashHook.h"

#import "NSArray+CrashHook.h"
#import "NSMutableArray+CrashHook.h"

#import "NSDictionary+CrashHook.h"
#import "NSMutableDictionary+CrashHook.h"

#import "NSString+CrashHook.h"
#import "NSMutableString+CrashHook.h"

#import "NSAttributedString+CrashHook.h"
#import "NSMutableAttributedString+CrashHook.h"

//define
#import "CrashHookProxyObj.h"


NS_ASSUME_NONNULL_BEGIN

@interface CrashHooker : NSObject

/**
 *
 *  开始生效.你可以在AppDelegate的didFinishLaunchingWithOptions方法中调用becomeEffective方法
 *  【默认开启  对”unrecognized selector sent to instance”防止崩溃的处理】
 *
 *  这是全局生效，若你只需要部分生效，你可以单个进行处理，比如:
 *  [NSArray crashHookExchangeMethod];
 *  [NSMutableArray crashHookExchangeMethod];
 *  .................
 *  .................
 *
 */
+ (void)enbleCrashHookMode;

/**
 *  初始化一个需要防止”unrecognized selector sent to instance”的崩溃的类名数组
 *  ⚠️不可将@"NSObject"加入classStrings数组中
 *  ⚠️不可将UI前缀的字符串加入classStrings数组中
 */
+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings;
/**
 *  初始化一个需要防止”unrecognized selector sent to instance”的崩溃的类名前缀的数组
 *  ⚠️不可将UI前缀的字符串(包括@"UI")加入classStringPrefixs数组中
 *  ⚠️不可将NS前缀的字符串(包括@"NS")加入classStringPrefixs数组中
 */
+ (void)setupNoneSelClassStringPrefixsArr:(NSArray<NSString *> *)classStringPrefixs;
//您可以忽略以下方法

+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

+ (void)noteErrorWithException:(NSException *)exception defaultToDo:(NSString *)defaultToDo;


@end

NS_ASSUME_NONNULL_END
