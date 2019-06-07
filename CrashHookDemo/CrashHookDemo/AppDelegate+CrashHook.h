//
//  AppDelegate+CrashHook.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (CrashHook)
- (void)enableSafeMode;
@end

NS_ASSUME_NONNULL_END
