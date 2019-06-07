//
//  NSMutableDictionary+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSMutableDictionary+CrashHook.h"
#import "CrashHooker.h"

@implementation NSMutableDictionary (CrashHook)

+ (void)crashHookExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [CrashHooker exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKey:) method2Sel:@selector(crashHookSetObject:forKey:)];
        
        //setObject:forKeyedSubscript:
        if (CrashHookIsiOS(11.0)) {
            [CrashHooker exchangeInstanceMethod:dictionaryM method1Sel:@selector(setObject:forKeyedSubscript:) method2Sel:@selector(crashHookSetObject:forKeyedSubscript:)];
        }
        
        
        
        //removeObjectForKey:
        Method removeObjectForKey = class_getInstanceMethod(dictionaryM, @selector(removeObjectForKey:));
        Method CrashHookRemoveObjectForKey = class_getInstanceMethod(dictionaryM, @selector(crashHookRemoveObjectForKey:));
        method_exchangeImplementations(removeObjectForKey, CrashHookRemoveObjectForKey);
    });
}


//=================================================================
//                       setObject:forKey:
//=================================================================
#pragma mark - setObject:forKey:

- (void)crashHookSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self crashHookSetObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}

//=================================================================
//                  setObject:forKeyedSubscript:
//=================================================================
#pragma mark - setObject:forKeyedSubscript:
- (void)crashHookSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self crashHookSetObject:obj forKeyedSubscript:key];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                       removeObjectForKey:
//=================================================================
#pragma mark - removeObjectForKey:

- (void)crashHookRemoveObjectForKey:(id)aKey {
    
    @try {
        [self crashHookRemoveObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}


@end
