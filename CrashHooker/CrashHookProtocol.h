//
//  CrashHookProtocol.h
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CrashHookProtocol <NSObject>

@required
+ (void)crashHookExchangeMethod;

@end

NS_ASSUME_NONNULL_END
