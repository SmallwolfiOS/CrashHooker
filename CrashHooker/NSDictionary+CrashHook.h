//
//  NSDictionary+CrashHook.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CrashHookProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (CrashHook)<CrashHookProtocol>

@end
/**
 *  Can avoid crash method
 *
 *  1. NSDictionary的快速创建方式 NSDictionary *dict = @{@"frameWork" : @"AvoidCrash"}; //这种创建方式其实调用的是2中的方法
 *  2. +(instancetype)dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
 *
 */
NS_ASSUME_NONNULL_END
