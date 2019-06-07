//
//  NSMutableString+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSMutableString+CrashHook.h"
#import "CrashHooker.h"

@implementation NSMutableString (CrashHook)

+ (void)crashHookExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class stringClass = NSClassFromString(@"__NSCFString");
        
        //replaceCharactersInRange
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(replaceCharactersInRange:withString:) method2Sel:@selector(crashHookReplaceCharactersInRange:withString:)];
        
        //insertString:atIndex:
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(insertString:atIndex:) method2Sel:@selector(crashHookInsertString:atIndex:)];
        
        //deleteCharactersInRange
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(deleteCharactersInRange:) method2Sel:@selector(crashHookDeleteCharactersInRange:)];
    });
}

//=================================================================
//                     replaceCharactersInRange
//=================================================================
#pragma mark - replaceCharactersInRange

- (void)crashHookReplaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    
    @try {
        [self crashHookReplaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

//=================================================================
//                     insertString:atIndex:
//=================================================================
#pragma mark - insertString:atIndex:

- (void)crashHookInsertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self crashHookInsertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

//=================================================================
//                   deleteCharactersInRange
//=================================================================
#pragma mark - deleteCharactersInRange

- (void)crashHookDeleteCharactersInRange:(NSRange)range {
    
    @try {
        [self crashHookDeleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultIgnore;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        
    }
}

@end
