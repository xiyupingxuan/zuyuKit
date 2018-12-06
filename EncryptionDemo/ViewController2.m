//
//  ViewController2.m
//  EncryptionDemo
//
//  Created by 王祖宇 on 2018/12/6.
//  Copyright © 2018年 zuyu. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property(nonatomic,strong) NSString *str;
@property(nonatomic,assign) void (^block)(void);
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(zuyuYes) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view.
}

-(void)zuyuYes
{
    NSLog(@"---zuyuYES");
}

-(void)dealloc
{
    NSLog(@"----------------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
