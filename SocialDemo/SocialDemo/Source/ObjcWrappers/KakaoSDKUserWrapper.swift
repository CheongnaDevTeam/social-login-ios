//
//  KakaoSDKUserWrapper.swift
//  SocialDemo
//
//  Created by 이원빈 on 8/5/24.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

// KakaoSDKUser 모듈의 @objc Wrapper 클래스 예제입니다.
// 아래 예시 외의 API들도 같은 형식으로 추가하여 사용 가능합니다.
// Objective-C에서 사용 불가능한 Swift 모델 클래스 프로퍼티는 [String:Any]? 타입으로 반환받아 사용할 수 있습니다.

@objc
class KakaoSDKUserWrapper : NSObject {
    @objc
    public static let shared = KakaoSDKUserWrapper()
    
    // 카카오톡 간편 로그인 가능 여부 체크
    @objc
    public static func isKakaoTalkLoginAvailable() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string:Urls.compose(.TalkAuth, path:Paths.authTalk))!)
    }
    
    // 카카오톡으로 로그인
    @objc
    public func loginWithKakaoTalk(channelPublicIds: [String]? = nil,
                                      serviceTerms: [String]? = nil,
                                      nonce: String? = nil,
                                      completion: @escaping ([String : Any]?, Error?) -> Void) {

        UserApi.shared.loginWithKakaoTalk { token, error in
            if let error = error {
                completion(nil, error)
            }
            else {
                if let tokenData = try? SdkJSONEncoder.customDate.encode(token) {
                    let tokenInfo = try? JSONSerialization.jsonObject(with: tokenData, options: .allowFragments) as? [String : Any]
                    completion(tokenInfo, nil)
                }
                else {
                    completion(nil, SdkError(reason: .Unknown, message: "Encoding Failed"))
                }
            }
        }
    }
    
    // 카카오계정으로 로그인
    @objc
    public func loginWithKakaoAccount(prompts : [String]? = nil,
                                      loginHint: String? = nil,
                                      completion: @escaping ([String:Any]?, Error?) -> Void) {
        
        var promptParams : [Prompt]? = []
        prompts?.forEach({ promptString in
            if let _prompt = Prompt(rawValue: promptString) {
                promptParams?.append(_prompt)
            }
        })
        
        UserApi.shared.loginWithKakaoAccount(prompts: promptParams, loginHint: loginHint) { token, error in
            if let error = error {
                completion(nil, error)
            }
            else {
                if let tokenData = try? SdkJSONEncoder.customDate.encode(token) {
                    let tokenInfo = try? JSONSerialization.jsonObject(with: tokenData, options: .allowFragments) as? [String : Any]
                    completion(tokenInfo, nil)
                }
                else {
                    completion(nil, SdkError(reason: .Unknown, message: "Encoding Failed"))
                }
            }
        }
    }
    
    // 로그아웃
    @objc
    public func logout(completion: @escaping (Error?) -> Void) {
        UserApi.shared.logout { error in
            if let error = error {
                completion(error)
            }
            else {
                print("== logout success")
            }
        }
    }
    
    // 사용자 정보 가져오기
    @objc
    public func me(propertyKeys: [String]? = nil,
                   secureResource: Bool = false,
                   completion: @escaping ([String:Any]?, Error?) -> Void) {
        
        UserApi.shared.me(propertyKeys: propertyKeys, secureResource: secureResource, completion: { user, error in
            if let error = error {
                completion(nil, error)
            }
            else {
                if let userData = try? SdkJSONEncoder.customDate.encode(user) {
                    let userInfo = try? JSONSerialization.jsonObject(with: userData, options: .allowFragments) as? [String : Any]
                    completion(userInfo, nil)
                }
                else {
                    completion(nil, SdkError(reason: .Unknown, message: "Encoding Failed"))
                }
            }
        })
    }
    
    // 토큰 정보 보기
    @objc
    public func accessTokenInfo(completion: @escaping ([String:Any]?, Error?) -> Void) {
        
        UserApi.shared.accessTokenInfo(completion: { tokenInfo, error in
            if let error = error {
                completion(nil, error)
            }
            else {
                if let tokenInfoData = try? SdkJSONEncoder.customDate.encode(tokenInfo) {
                    let tokenInfo = try? JSONSerialization.jsonObject(with: tokenInfoData, options: .allowFragments) as? [String : Any]
                    completion(tokenInfo, nil)
                }
                else {
                    completion(nil, SdkError(reason: .Unknown, message: "Encoding Failed"))
                }
            }
        })
    }
    
    // 사용자 프로퍼티 저장하기
    @objc
    public func updateProfile(properties: [String:Any],
                              completion:@escaping (Error?) -> Void) {
        UserApi.shared.updateProfile(properties: properties) { error in
            if let error = error {
                completion(error)
            }
            else {
                completion(nil)
            }
        }
    }
    
    // 위 형식을 참고해 이 외 필요한 메서드 추가
    // ...
}
