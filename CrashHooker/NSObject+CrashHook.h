//
//  NSObject+CrashHook.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CrashHook)
/**
 *  开启"unrecognized selector sent to instance"异常的捕获
 */
+ (void)crashHookExchangeMethod;


+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings;
+ (void)setupNoneSelClassStringPrefixsArr:(NSArray<NSString *> *)classStringPrefixs;
@end

/**
 *  Can avoid crash method
 *
 *  1.- (void)setValue:(id)value forKey:(NSString *)key
 *  2.- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
 *  3.- (void)setValue:(id)value forUndefinedKey:(NSString *)key //这个方法一般用来重写，不会主动调用
 *  4.- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
 *  5. unrecognized selector sent to instance
 */

NS_ASSUME_NONNULL_END
