//
//  NSString+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "NSString+CrashHook.h"
#import "CrashHooker.h"

@implementation NSString (CrashHook)

+ (void)crashHookExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        //characterAtIndex
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(characterAtIndex:) method2Sel:@selector(crashHookCharacterAtIndex:)];
        
        //substringFromIndex
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(substringFromIndex:) method2Sel:@selector(crashHookSubstringFromIndex:)];
        
        //substringToIndex
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(substringToIndex:) method2Sel:@selector(crashHookSubstringToIndex:)];
        
        //substringWithRange:
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(substringWithRange:) method2Sel:@selector(crashHookSubstringWithRange:)];
        
        //stringByReplacingOccurrencesOfString:
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:) method2Sel:@selector(crashHookStringByReplacingOccurrencesOfString:withString:)];
        
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) method2Sel:@selector(crashHookStringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //stringByReplacingCharactersInRange:withString:
        [CrashHooker exchangeInstanceMethod:stringClass method1Sel:@selector(stringByReplacingCharactersInRange:withString:) method2Sel:@selector(crashHookStringByReplacingCharactersInRange:withString:)];
    });
    
}


//=================================================================
//                           characterAtIndex:
//=================================================================
#pragma mark - characterAtIndex:

- (unichar)crashHookCharacterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self crashHookCharacterAtIndex:index];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"CrashHook default is to return a without assign unichar.";
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return characteristic;
    }
}

//=================================================================
//                           substringFromIndex:
//=================================================================
#pragma mark - substringFromIndex:

- (NSString *)crashHookSubstringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashHookSubstringFromIndex:from];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

//=================================================================
//                           substringToIndex
//=================================================================
#pragma mark - substringToIndex

- (NSString *)crashHookSubstringToIndex:(NSUInteger)to {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashHookSubstringToIndex:to];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}


//=================================================================
//                           substringWithRange:
//=================================================================
#pragma mark - substringWithRange:

- (NSString *)crashHookSubstringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self crashHookSubstringWithRange:range];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

//=================================================================
//                stringByReplacingOccurrencesOfString:
//=================================================================
#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)crashHookStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashHookStringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

//=================================================================
//  stringByReplacingOccurrencesOfString:withString:options:range:
//=================================================================
#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)crashHookStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashHookStringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


//=================================================================
//       stringByReplacingCharactersInRange:withString:
//=================================================================
#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)crashHookStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self crashHookStringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = CrashHookDefaultReturnNil;
        [CrashHooker noteErrorWithException:exception defaultToDo:defaultToDo];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


@end
