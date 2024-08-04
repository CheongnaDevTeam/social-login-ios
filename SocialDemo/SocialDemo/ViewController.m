//
//  ViewController.m
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.label = [[UILabel alloc] init];
  self.label.text = @"Hello, World!";
  self.label.textAlignment = NSTextAlignmentCenter;
  self.label.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.label];
  
  [NSLayoutConstraint activateConstraints:@[
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    [self.label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
  ]];
}

@end
