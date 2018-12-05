//
//  ViewController.m
//  EncryptionDemo
//
//  Created by zuyu on 2018/12/4.
//  Copyright © 2018年 zuyu. All rights reserved.
//

#import "NSString+ZuyuHash.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *password = @"123456";
    
    NSLog( @" 32个字符的MD5散列字符串  ------>>>>>>>%@",password.md5String);

    NSLog( @" 40个字符的SHA1散列字符串  ------>>>>>>>%@",password.sha1String);

    NSLog( @" 64个字符的SHA256散列字符串  ------>>>>>>>%@",password.sha256String);

    NSLog( @" 128个字符的SHA 512散列字符串  ------>>>>>>>%@",password.sha512String);

    /** HMAC
     *  使用一个密钥加密，并且做两次散列
     *  在实际开发中，密钥（KEY）来自于服务器（动态的）
     *  一个账号，对应一个KEY
     */
    NSLog( @" 32个字符的HMAC MD5散列字符串  ------>>>>>>>%@",[password hmacMD5StringWithKey:@"zuyu"]);

    NSLog( @" 40个字符的HMAC SHA1散列字符串  ------>>>>>>>%@",[password hmacSHA1StringWithKey:@"zuyu"]);

    NSLog( @" 64个字符的HMAC SHA256散列字符串  ------>>>>>>>%@",[password hmacSHA256StringWithKey:@"zuyu"]);
    
    NSLog( @" 128个字符的HMAC SHA512散列字符串  ------>>>>>>>%@",[password hmacSHA512StringWithKey:@"zuyu"]);

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
