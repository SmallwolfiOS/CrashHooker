//
//  NSObject+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSObject+CrashHook.h"
#import "CrashHooker.h"
#import "CrashHookProxyObj.h"

@implementation NSObject (CrashHook)


+ (void)crashHookExchangeMethod{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //setValue:forKey:
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKey:) method2Sel:@selector(crashHookSetValue:forKey:)];
        
        //setValue:forKeyPath:
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forKeyPath:) method2Sel:@selector(crashHookSetValue:forKeyPath:)];
        
        //setValue:forUndefinedKey:
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(setValue:forUndefinedKey:) method2Sel:@selector(crashHookSetValue:forUndefinedKey:)];
        
        //setValuesForKeysWithDictionary:
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(setValuesForKeysWithDictionary:) method2Sel:@selector(crashHookSetValuesForKeysWithDictionary:)];
        
        
        //unrecognized selector sent to instance
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(methodSignatureForSelector:) method2Sel:@selector(crashHookMethodSignatureForSelector:)];
        [CrashHooker exchangeInstanceMethod:[self class] method1Sel:@selector(forwardInvocation:) method2Sel:@selector(crashHookForwardInvocation:)];
    });
}


//=================================================================
//              unrecognized selector sent to instance
//=================================================================
#pragma mark - unrecognized selector sent to instance


static NSMutableArray *noneSelClassStrings;
static NSMutableArray *noneSelClassStringPrefixs;

+ (void)setupNoneSelClassStringsArr:(NSArray<NSString *> *)classStrings {
    
    if (noneSelClassStrings) {
        
        NSString *warningMsg = [NSString stringWithFormat:@"\n\n%@\n\n[CrashHook setupNoneSelClassStringsArr:];\n调用一此即可，多次调用会自动忽略后面的调用\n\n%@\n\n",CrashHookSeparatorWithFlag,CrashHookSeparator];
        CrashHookLog(@"%@",warningMsg);
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noneSelClassStrings = [NSMutableArray array];
        for (NSString *className in classStrings) {
            if ([className hasPrefix:@"UI"] == NO &&
                [className isEqualToString:NSStringFromClass([NSObject class])] == NO) {
                [noneSelClassStrings addObject:className];
                
            } else {
                NSString *warningMsg = [NSString stringWithFormat:@"\n\n%@\n\n[CrashHook setupNoneSelClassStringsArr:];\n会忽略UI开头的类和NSObject类(请使用NSObject的子类)\n\n%@\n\n",CrashHookSeparatorWithFlag,CrashHookSeparator];
                CrashHookLog(@"%@",warningMsg);
            }
        }
    });
}
/**
 *  初始化一个需要防止”unrecognized selector sent to instance”的崩溃的类名前缀的数组
 */
+ (void)setupNoneSelClassStringPrefixsArr:(NSArray<NSString *> *)classStringPrefixs {
    if (noneSelClassStringPrefixs) {
        
        NSString *warningMsg = [NSString stringWithFormat:@"\n\n%@\n\n[CrashHook setupNoneSelClassStringPrefixsArr:];\n调用一此即可，多次调用会自动忽略后面的调用\n\n%@\n\n",CrashHookSeparatorWithFlag,CrashHookSeparator];
        CrashHookLog(@"%@",warningMsg);
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        noneSelClassStringPrefixs = [NSMutableArray array];
        for (NSString *classNamePrefix in classStringPrefixs) {
            if ([classNamePrefix hasPrefix:@"UI"] == NO &&
                [classNamePrefix hasPrefix:@"NS"] == NO) {
                [noneSelClassStringPrefixs addObject:classNamePrefix];
                
            } else {
                NSString *warningMsg = [NSString stringWithFormat:@"\n\n%@\n\n[CrashHook setupNoneSelClassStringsArr:];\n会忽略UI开头的类和NS开头的类\n若需要对NS开头的类防止”unrecognized selector sent to instance”(比如NSArray),请使用setupNoneSelClassStringsArr:\n\n%@\n\n",CrashHookSeparatorWithFlag,CrashHookSeparator];
                CrashHookLog(@"%@",warningMsg);
            }
        }
    });
}
- (NSMethodSignature *)crashHookMethodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *ms = [self crashHookMethodSignatureForSelector:aSelector];
    
    BOOL flag = NO;
    if (ms == nil) {
        for (NSString *classStr in noneSelClassStrings) {
            if ([self isKindOfClass:NSClassFromString(classStr)]) {
                ms = [CrashHookProxyObj instanceMethodSignatureForSelector:@selector(proxyObjMethod)];
                flag = YES;
                break;
            }
        }
    }
    if (flag == NO) {
        NSString *selfClass = NSStringFromClass([self class]);
        for (NSString *classStrPrefix in noneSelClassStringPrefixs) {
            if ([selfClass hasPrefix:classStrPrefix]) {
                ms = [CrashHookProxyObj instanceMethodSignatureForSelector:@selector(proxyObjMethod)];
            }
        }
    }
    return ms;
}

- (void)crashHookForwardInvocation:(NSInvocation *)anInvocation {
    
    @try {
        [self crashHookForwardInvocation:anInvocation];
        
    } @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
    
}


//=================================================================
//                         setValue:forKey:
//=================================================================
#pragma mark - setValue:forKey:

- (void)crashHookSetValue:(id)value forKey:(NSString *)key {
    @try {
        [self crashHookSetValue:value forKey:key];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}


//=================================================================
//                     setValue:forKeyPath:
//=================================================================
#pragma mark - setValue:forKeyPath:

- (void)crashHookSetValue:(id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self crashHookSetValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}



//=================================================================
//                     setValue:forUndefinedKey:
//=================================================================
#pragma mark - setValue:forUndefinedKey:

- (void)crashHookSetValue:(id)value forUndefinedKey:(NSString *)key {
    @try {
        [self crashHookSetValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}


//=================================================================
//                  setValuesForKeysWithDictionary:
//=================================================================
#pragma mark - setValuesForKeysWithDictionary:

- (void)crashHookSetValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    @try {
        [self crashHookSetValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}


@end
