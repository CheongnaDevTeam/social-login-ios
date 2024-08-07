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

// MARK: - View LifeCycle
- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  [self setupLabel];
  [self setupButton];
  [self setupViewHierarchy];
  [self setupViewConstraints];
}

// MARK: - Methods
- (void)loginWithKakaoTalkApp {
  [[KakaoSDKUserWrapper shared]
   loginWithKakaoTalkWithChannelPublicIds:nil
   serviceTerms:nil
   nonce:nil
   completion:^(NSDictionary * _Nullable tokenInfo, NSError * _Nullable error) {
    if (error) {
      NSLog(@"Error: %@", error.localizedDescription);
    } else {
      NSLog(@"loginWithKakaoTalk() success.");
      NSLog(@"Token Info: %@", tokenInfo);
    }
  }];
}

- (void)loginWithKakaoAccount {
  [[KakaoSDKUserWrapper shared]
   loginWithKakaoAccountWithPrompts:nil
   loginHint:nil
   completion:^(NSDictionary<NSString *,id> * _Nullable oauthToken, NSError * _Nullable error) {
    if (error) {
      NSLog(@"Error: %@", error.localizedDescription);
    } else {
      NSLog(@"loginWithKakaoAccount() success.");
      NSLog(@"oauthToken Info: %@", oauthToken);
    }
  }];
}

// MARK: - UI Setup
- (void)setupLabel {
  self.label = [[UILabel alloc] init];
  self.label.text = @"Hello, World!";
  self.label.textAlignment = NSTextAlignmentCenter;
  self.label.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setupButton {
  self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
  self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
  UIImage *kakaoLoginImage = [UIImage imageNamed:@"kakao_login_button"];
  [self.loginButton setImage:kakaoLoginImage forState:UIControlStateNormal];
  self.loginButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.loginButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTapped:(UIButton *)sender {
  NSLog(@"버튼이 클릭되었습니다!");
  if ([KakaoSDKUserWrapper isKakaoTalkLoginAvailable]) {
    [self loginWithKakaoTalkApp];
  } else {
    // 카카오톡이 설치되어있지 않은 경우
    [self loginWithKakaoAccount];
  }
}

- (void)setupViewHierarchy {
  [self.view addSubview:self.label];
  [self.view addSubview:self.loginButton];
}

- (void)setupViewConstraints {
  [NSLayoutConstraint activateConstraints:@[
    [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    [self.label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
  ]];
  
  [NSLayoutConstraint activateConstraints:@[
    [self.loginButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    [self.loginButton.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:20],
  ]];
}

@end
