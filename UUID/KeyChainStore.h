//
//  KeyChainStore.h
//  Created by 王祖宇 on 17/4/20.
//  Copyright © 2017年 王祖宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainStore : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;
@end
