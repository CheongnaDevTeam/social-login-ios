//
//  ViewController.m
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

#import "ViewController.h"
#import "SocialDemo-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *loginButton;

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
  
  self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
  self.loginButton.frame = CGRectMake(100, 100, 200, 50);
  [self.loginButton setTitle:@"카카오로그인" forState:UIControlStateNormal];
  [self.loginButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.loginButton];
}

- (void)buttonTapped:(UIButton *)sender {
  NSLog(@"버튼이 클릭되었습니다!");
  if ([KakaoSDKUserWrapper isKakaoTalkLoginAvailable]) {
    [[KakaoSDKUserWrapper shared] loginWithKakaoTalkWithChannelPublicIds:nil serviceTerms:nil nonce:nil completion:^(NSDictionary * _Nullable tokenInfo, NSError * _Nullable error) {
      if (error) {
        NSLog(@"Error: %@", error.localizedDescription);
      } else {
        NSLog(@"loginWithKakaoTalk() success.");
        NSLog(@"Token Info: %@", tokenInfo);
      }
    }];
  } else {
    // 카카오톡이 설치되어있지 않은 경우
    [[KakaoSDKUserWrapper shared] loginWithKakaoAccountWithPrompts:nil loginHint:nil completion:^(NSDictionary<NSString *,id> * _Nullable oauthToken, NSError * _Nullable error) {
      if (error) {
        NSLog(@"Error: %@", error.localizedDescription);
      } else {
        NSLog(@"loginWithKakaoAccount() success.");
        NSLog(@"oauthToken Info: %@", oauthToken);
      }
    }];
  }
}

@end
