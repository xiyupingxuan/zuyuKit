//
//  UINavigationController+ZuyuMemoryLeak.m
//  EncryptionDemo
//
//  Created by 王祖宇 on 2018/12/6.
//  Copyright © 2018年 zuyu. All rights reserved.
//

#import "UINavigationController+ZuyuMemoryLeak.h"
#import <objc/runtime.h>

//;

@implementation UINavigationController (ZuyuMemoryLeak)
+(void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        [self zuyu_swizzleOriSEL:@selector(popViewControllerAnimated:) currentSEL:@selector(zuyu_popViewControllerAnimated:)];
    });
}

+(void)zuyu_swizzleOriSEL:(SEL)oriSEL currentSEL:(SEL)currentSEL
{
    Method oriMethod = class_getInstanceMethod([self class], oriSEL);
    Method currentMethod = class_getInstanceMethod([self class], currentSEL);
    method_exchangeImplementations(oriMethod, currentMethod);
}


-(UIViewController *)zuyu_popViewControllerAnimated:(BOOL)animated
{
    UIViewController *popVC = [self zuyu_popViewControllerAnimated:animated];
    extern const void *const hasBeenPop;
    objc_setAssociatedObject(popVC, &hasBeenPop, @(YES),  OBJC_ASSOCIATION_RETAIN);
    return popVC;
}
@end
