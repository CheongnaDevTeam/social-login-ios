//
//  SceneDelegate.m
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
  
  if (![scene isKindOfClass:[UIWindowScene class]]) {
    return;
  }
  UIWindowScene *windowScene = (UIWindowScene *)scene;
  
  
  self.window = [[UIWindow alloc] initWithFrame:windowScene.coordinateSpace.bounds];
  self.window.windowScene = windowScene;
  
  ViewController *rootViewController = [[ViewController alloc] init];
  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  self.window.rootViewController = navController;
  [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {}
- (void)sceneDidBecomeActive:(UIScene *)scene {}
- (void)sceneWillResignActive:(UIScene *)scene {}
- (void)sceneWillEnterForeground:(UIScene *)scene {}
- (void)sceneDidEnterBackground:(UIScene *)scene {}

@end
