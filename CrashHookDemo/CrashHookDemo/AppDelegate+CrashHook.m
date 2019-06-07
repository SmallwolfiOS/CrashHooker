//
//  AppDelegate+CrashHook.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "AppDelegate+CrashHook.h"
#import "CrashHooker.h"
@implementation AppDelegate (CrashHook)

- (void)enableSafeMode{
    [CrashHooker enbleCrashHookMode];
    
//    [CrashHooker setupNoneSelClassStringsArr:@[
//                                               @"AppDelegate",
//                                               ]];
    
    
}

@end
