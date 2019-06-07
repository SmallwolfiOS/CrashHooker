//
//  NSMutableArray+CrashHook.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CrashHookProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (CrashHook)<CrashHookProtocol>

@end
/**
 *  Can avoid crash method
 *
 *  1. - (id)objectAtIndex:(NSUInteger)index
 *  2. - (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
 *  3. - (void)removeObjectAtIndex:(NSUInteger)index
 *  4. - (void)insertObject:(id)anObject atIndex:(NSUInteger)index
 *  5. - (void)getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
 */
NS_ASSUME_NONNULL_END
