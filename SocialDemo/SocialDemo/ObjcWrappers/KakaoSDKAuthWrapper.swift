//  Copyright 2019 Kakao Corp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth

// KakaoSDKAuth 모듈의 @objc Wrapper 클래스 예제입니다.
// Objective-C에서 사용 불가능한 Swift 모델 클래스 프로퍼티는 [String:Any]? 타입으로 반환받아 사용할 수 있습니다.

@objc
class KakaoSDKAuthWrapper : NSObject {
    @objc
    public static let shared = KakaoSDKAuthWrapper()
    
    
    // 토큰 정보 보기
    @objc
    public func getToken() -> [String:Any]? {
        let token = AUTH.tokenManager.getToken()

        if let tokenData = try? SdkJSONEncoder.customDate.encode(token) {
            let tokenInfo = try? JSONSerialization.jsonObject(with: tokenData, options: .allowFragments)

//            print("== encoded tokenInfo: \(String(describing: tokenInfo))")
            return tokenInfo as? [String : Any]
        }
        return nil
    }
    
    @objc
    public static func isKakaoTalkLoginUrl(_ url:URL) -> Bool {
        return AuthApi.isKakaoTalkLoginUrl(url)
    }
    
    @objc
    public static func handleOpenUrl(url:URL,  options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return AuthController.handleOpenUrl(url: url, options: options)
    }
  
  func a() {
    
  }
    
    // 위 형식을 참고해 이 외 필요한 메서드 추가
    // ...
}

