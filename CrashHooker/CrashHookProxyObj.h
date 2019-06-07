//
//  CrashHookProxyObj.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CrashHookNotification @"CrashHookNotification"
#define CrashHookIsiOS(version) ([[UIDevice currentDevice].systemVersion floatValue] >= version)


//user can ignore below define
#define CrashHookDefaultReturnNil  @"CrashHook default is to return nil to avoid crash."
#define CrashHookDefaultIgnore     @"CrashHook default is to ignore this operation to avoid crash."

#define CrashHookSeparator         @"================================================================="
#define CrashHookSeparatorWithFlag @"========================CrashHooker Log=========================="


#ifdef DEBUG

#define  CrashHookLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])

#else

#define CrashHookLog(...)
#endif
NS_ASSUME_NONNULL_BEGIN

@interface CrashHookProxyObj : NSObject

- (void)proxyObjMethod;

@end

NS_ASSUME_NONNULL_END
