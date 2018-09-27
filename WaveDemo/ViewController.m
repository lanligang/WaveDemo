//
//  ViewController.m
//  WaveDemo
//
//  Created by ios2 on 2018/9/27.
//  Copyright © 2018年 ios2. All rights reserved.
//

#import "ViewController.h"
#import "WaveAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	WaveAnimationView *v =[[WaveAnimationView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
	v.layer.cornerRadius = 100.0f;

	[self.view addSubview:v];



	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
