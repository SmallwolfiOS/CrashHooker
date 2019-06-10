//
//  ViewController.m
//  CrashHookDemo
//
//  Created by 马海平 on 2019/6/7.
//  Copyright © 2019 马海平. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField * textf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [self.view addSubview:textf];
    
    textf.backgroundColor = [UIColor redColor];
    
}


@end
