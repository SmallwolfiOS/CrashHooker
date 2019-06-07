//
//  NSAttributedString+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSAttributedString+CrashHook.h"
#import "CrashHooker.h"

@implementation NSAttributedString (CrashHook)

+ (void)crashHookExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [CrashHooker exchangeInstanceMethod:NSConcreteAttributedString method1Sel:@selector(initWithString:) method2Sel:@selector(crashHookInitWithString:)];
        
        //initWithAttributedString
        [CrashHooker exchangeInstanceMethod:NSConcreteAttributedString method1Sel:@selector(initWithAttributedString:) method2Sel:@selector(crashHookInitWithAttributedString:)];
        
        //initWithString:attributes:
        [CrashHooker exchangeInstanceMethod:NSConcreteAttributedString method1Sel:@selector(initWithString:attributes:) method2Sel:@selector(CrashHookInitWithString:attributes:)];
    });
    
}

//=================================================================
//                           initWithString:
//=================================================================
#pragma mark - initWithString:

- (instancetype)crashHookInitWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self crashHookInitWithString:str];
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
//                          initWithAttributedString
//=================================================================
#pragma mark - initWithAttributedString

- (instancetype)crashHookInitWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self crashHookInitWithAttributedString:attrStr];
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
//                      initWithString:attributes:
//=================================================================
#pragma mark - initWithString:attributes:

- (instancetype)crashHookInitWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self crashHookInitWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}

@end
