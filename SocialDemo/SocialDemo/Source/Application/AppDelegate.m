//
//  AppDelegate.m
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

#import "AppDelegate.h"
#import "SocialDemo-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSString *kakaoNativeAppKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"KAKAO_NATIVE_APPKEY"];
  if (kakaoNativeAppKey) {
    
//    [[KakaoSDKCommonWrapper shared] initSDKWithAppKey:@"7406e4b625e29272d35b30edb8436055"];
    [[KakaoSDKCommonWrapper shared] initSDKWithAppKey:kakaoNativeAppKey];
  } else {
    NSLog(@"KAKAO_NATIVE_APPKEY가 지정되지 않았습니다.");
  }
  return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
  // Called when a new scene session is being created.
  // Use this method to select a configuration to create the new scene with.
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
  // Called when the user discards a scene session.
  // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
  // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
