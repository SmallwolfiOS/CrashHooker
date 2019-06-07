//
//  NSMutableArray+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSMutableArray+CrashHook.h"
#import "CrashHooker.h"

@implementation NSMutableArray (CrashHook)

+ (void)crashHookExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        
        //objectAtIndex:
        [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(objectAtIndex:) method2Sel:@selector(crashHookObjectAtIndex:)];
        
        //objectAtIndexedSubscript
        if (CrashHookIsiOS(11.0)) {
            [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(crashHookObjectAtIndexedSubscript:)];
        }
        
        
        //setObject:atIndexedSubscript:
        [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(setObject:atIndexedSubscript:) method2Sel:@selector(crashHookSetObject:atIndexedSubscript:)];
        
        
        //removeObjectAtIndex:
        [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(removeObjectAtIndex:) method2Sel:@selector(crashHookRemoveObjectAtIndex:)];
        
        //insertObject:atIndex:
        [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(insertObject:atIndex:) method2Sel:@selector(crashHookInsertObject:atIndex:)];
        
        //getObjects:range:
        [CrashHooker exchangeInstanceMethod:arrayMClass method1Sel:@selector(getObjects:range:) method2Sel:@selector(crashHookGetObjects:range:)];
    });
    
    
    
}


//=================================================================
//                    array set object at index
//=================================================================
#pragma mark - get object from array


- (void)crashHookSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self crashHookSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    removeObjectAtIndex:
//=================================================================
#pragma mark - removeObjectAtIndex:

- (void)crashHookRemoveObjectAtIndex:(NSUInteger)index {
    @try {
        [self crashHookRemoveObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                    insertObject:atIndex:
//=================================================================
#pragma mark - set方法
- (void)crashHookInsertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self crashHookInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [CrashHooker noteErrorWithException:exception defaultToDo:CrashHookDefaultIgnore];
    }
    @finally {
        
    }
}


//=================================================================
//                           objectAtIndex:
//=================================================================
#pragma mark - objectAtIndex:

- (id)crashHookObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self crashHookObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}

//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)crashHookObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self crashHookObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
    
}


//=================================================================
//                         getObjects:range:
//=================================================================
#pragma mark - getObjects:range:

- (void)crashHookGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self crashHookGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
}

@end
