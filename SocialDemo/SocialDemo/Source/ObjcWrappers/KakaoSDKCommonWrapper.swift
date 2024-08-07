//
//  KakaoSDKCommonWrapper.swift
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

import Foundation
import KakaoSDKCommon

// KakaoSDKCommon 모듈의 @objc Wrapper 클래스 예제입니다.

@objc
class KakaoSDKCommonWrapper : NSObject {
    @objc
    public static let shared = KakaoSDKCommonWrapper()
    
    // SDK 초기화
    @objc
    public func initSDK(appKey:String) {
        KakaoSDK.initSDK(appKey: appKey, loggingEnable:true)
    }
    
    // 위 형식을 참고해 이 외 필요한 메서드 추가
    // ...
}
