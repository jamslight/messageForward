//
//  ViewController.m
//  消息转发oc
//
//  Created by define on 2018/8/11.
//  Copyright © 2018年 刘绍强. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor whiteColor];
    Person *person = [[Person alloc]init];
    
    [person performSelector:@selector(try)];
    [person performSelector:@selector(run)];
    [person performSelector:@selector(code)];
    
    

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
