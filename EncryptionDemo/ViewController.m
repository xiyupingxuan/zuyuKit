//
//  ViewController.m
//  EncryptionDemo
//
//  Created by zuyu on 2018/12/4.
//  Copyright © 2018年 zuyu. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController pushViewController:[[ViewController2 alloc] init] animated:YES];
    
    
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.baidu.com/tcx?appui=alaxs&data=%7B%22fromaction%22%3A%22aladdintrans%22%7D&page=detail&gid=1695774947&sign=407da345977ec874651b3b68a1a76ab9&ts=1531682508&sourceurl=http%3A%2F%2Fwww.999wx.com%2Farticle%2F7%2F7270%2FDefault.shtml&evt=layerNextChapter&cid=1695774947%7C10119249387338904736&url=http%3A%2F%2Fwww.lingdiankanshu.com%2FHtml%2FBook%2F13%2F13739%2F6284246.html"]];
//    [self.view addSubview:webView];
//    [webView loadRequest:request];
    
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
