//
//  AppleLoginView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/3/24.
//

import SwiftUI
import AuthenticationServices

struct AppleLoginView: View {
    @State private var isLogin = false
    var body: some View {
        ZStack {
            Image("pokemonGen1BG 1")
                .resizable()
            NavigationStack {
                if isLogin {
                    NavigationLink(destination: DetailView()) {
                        SignInWithAppleButton(
                            onRequest: { request in
                                request.requestedScopes = [.fullName, .email]
                            },
                            onCompletion: { result in
                                switch result {
                                case .success(let authResults):
                                    print("Apple Login Success")
                                    switch authResults.credential {
                                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                        //계정정보 가져오기
                                        _ = appleIDCredential.user
                                        let fullName = appleIDCredential.fullName
                                        let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                                        let email = appleIDCredential.email
                                        let token = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                                        let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                                        self.isLogin = true
                                    default:
                                        break
                                    }
                                case .failure(let error):
                                    print(error.localizedDescription)
                                    print("error")
                                }
                            }
                        )
                        .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
                        .cornerRadius(5)
                    }
                }
                else {
                    SignInWithAppleButton(
                        onRequest: { request in
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { result in
                            switch result {
                            case .success(let authResults):
                                print("Apple Login Success")
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    //계정정보 가져오기
                                    _ = appleIDCredential.user
                                    let fullName = appleIDCredential.fullName
                                    let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                                    let email = appleIDCredential.email
                                    let token = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                                    let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                                    self.isLogin = false
                                default:
                                    break
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                                print("error")
                            }
                        }
                    )
                    .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
                    .cornerRadius(5)
                    
                }
            }
        }
    }
}

#Preview {
    AppleLoginView()
}
