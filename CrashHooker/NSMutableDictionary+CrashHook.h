//
//  NSMutableDictionary+CrashHook.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CrashHookProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (CrashHook)<CrashHookProtocol>

@end
/**
 *  Can avoid crash method
 *
 *  1. - (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
 *  2. - (void)removeObjectForKey:(id)aKey
 *
 */
NS_ASSUME_NONNULL_END
