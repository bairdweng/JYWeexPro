//
//  JYSDK.m
//  JYWeexPro
//
//  Created by Baird-weng on 2018/11/1.
//  Copyright © 2018年 JY. All rights reserved.
//

#import "JYSDK.h"
#import <ATSDK/ATManager.h>

@implementation JYSDK
+ (void)atAddPlugin {
    [[ATManager shareInstance] addPluginWithId:@"dev" andName:@"调试" andIconName:@"at_plugin_file" andEntry:@"" andArgs:@[@""]];
    [[ATManager shareInstance] addSubPluginWithParentId:@"dev" andSubId:@"scan" andName:@"扫码" andIconName:@"vision" andEntry:@"WXScanPlugin" andArgs:@[@""]];
    //    [[ATManager shareInstance] addSubPluginWithParentId:@"weex" andSubId:@"viewHierarchy" andName:@"hierarchy" andIconName:@"log" andEntry:@"WXATViewHierarchyPlugin" andArgs:@[@""]];
    [[ATManager shareInstance] addSubPluginWithParentId:@"dev" andSubId:@"refresh" andName:@"刷新" andIconName:@"at_arr_refresh" andEntry:@"WXRefreshPlugin" andArgs:@[@""]];
    [[ATManager shareInstance] show];
}
@end
