//
//  UIViewController+ZuyuMemoryLeak.m
//  EncryptionDemo
//
//  Created by 王祖宇 on 2018/12/6.
//  Copyright © 2018年 zuyu. All rights reserved.
//

#import "UIViewController+ZuyuMemoryLeak.h"
#import <objc/runtime.h>

const void *const hasBeenPop ;

@implementation UIViewController (ZuyuMemoryLeak)

+ (void)load {

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //willViewAppear
        //didDisAppear
        [self zuyu_swizzleOriSEL:@selector(viewWillAppear:) currentSEL:@selector(zuyu_viewWillAppear:)];
        
        [self zuyu_swizzleOriSEL:@selector(viewDidDisappear:) currentSEL:@selector(zuyu_viewDidDisappear:)];
    });
}


+(void)zuyu_swizzleOriSEL:(SEL)oriSEL currentSEL:(SEL)currentSEL
{
    Method oriMethod = class_getInstanceMethod([self class], oriSEL);
    Method currentMethod = class_getInstanceMethod([self class], currentSEL);
    method_exchangeImplementations(oriMethod, currentMethod);
}

-(void)zuyu_viewWillAppear:(BOOL)animated
{
    [self zuyu_viewWillAppear:animated];
    objc_setAssociatedObject(self, &hasBeenPop, @(NO),  OBJC_ASSOCIATION_RETAIN);
}

-(void)zuyu_viewDidDisappear:(BOOL)animated
{
    [self zuyu_viewDidDisappear:animated];
 
    if ([objc_getAssociatedObject(self,&hasBeenPop) boolValue]) {
        [self zuyuDealloc];
    }
}

-(void)zuyuDealloc
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof (self) strongSelf = weakSelf;
        NSLog(@"asjhdsakljfhdljkafhalkhfdkaasjhdsakljfhdljkafhalkhfdkaasjhdsakljfhdljkafhalkhfdkaasjhdsakljfhdljkafhalkhfdkaasjhdsakljfhdljkafhalkhfdka");
        NSLog(@"%@ 有泄露",NSStringFromClass([strongSelf class]));
    });
}


@end
