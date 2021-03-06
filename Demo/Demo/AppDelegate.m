//
//  AppDelegate.m
//  demo
//
//  Created by 王灼洲 on 2019/08/08.
//  Copyright © 2019 SensorsData. All rights reserved.
//

#import "AppDelegate.h"
#import <SensorsSDK/SensorsSDK.h>
#import "SensorsDataReleaseObject.h"
#import <AdSupport/AdSupport.h>

static NSString * const kGroupIdentifier = @"group.com.wangzhzh.demo.extension";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [SensorsAnalyticsSDK startWithServerURL:@"http://sdk-test.cloud.sensorsdata.cn:8006/sa?project=default&token=95c73ae661f85aa0"];
    // 在系统默认的 UserAgent 值中添加默认标记（" /sa-sdk-ios "）
    [[SensorsAnalyticsSDK sharedInstance] addWebViewUserAgent:nil];

    // 测试应用层未捕获异常
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSArray *array = @[];
//        NSLog(@"%@", array[0]);
//    });

    // 测试信号异常
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sensorsdata_app_crashed_reason"];
//    NSString *crashedReason = [[NSUserDefaults standardUserDefaults] stringForKey:@"sensorsdata_app_crashed_reason"];
//    if (crashedReason) {
//        NSLog(@"%@", crashedReason);
//    } else {
//        SensorsDataReleaseObject *obj = [[SensorsDataReleaseObject alloc] init];
//        [obj signalCrash];
//    }

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[SensorsAnalyticsSDK sharedInstance] trackFromAppExtensionForApplicationGroupIdentifier:kGroupIdentifier];
}

@end
