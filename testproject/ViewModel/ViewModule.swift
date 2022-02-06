//
//  ViewModule.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import Foundation
import EmailValidator
import Alamofire


class ViewModule : ObservableObject {
    @Published var email = "vasya@mail.com"
    @Published var password = "qwerty"
    @Published var firstName = "John"
    @Published var phone = "123"
    @Published var token = ""
    @Published var error1 = ""
    @Published var versions:[String] = []
    @Published var dishes:[Dishes] = []
    @Published var poisk = ""
    func LoginLn(success : @escaping () -> Void,error: @escaping () -> Void) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        var isValidEmail = emailPred.evaluate(with: email)
        if (!isValidEmail) {
            error1 = "Пользователь не найден"
            error()
            return
        }
        if (email == "" || password == "") {
            error1 = "Заполните поля"
            error()
            return
            
        }
        token = ""
        error1 = ""
        let LoginStruct = Login(email: email, password: password)
        AF.request("https://food.madskill.ru/auth/login", method: .post, parameters: LoginStruct, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: TokenType.self) {
                res in
                debugPrint(res)
                if (res.value?.token != nil) {
                    self.token = String(res.value!.token)
                    success()
                } else {
                    error()
                    self.error1 = res.error?.localizedDescription ?? ""
                }
                
                
            }
    }
    func RegisterLn(success: @escaping () -> Void, error: @escaping () -> Void) {
        if (email == "" || password == "" || firstName == "" || phone == "") {
            error1 = "Заполните поля"
            error()
            return
            
        }
        let RegisterStruct = Register(email: email, password: password, login: firstName)
        AF.request("https://food.madskill.ru/auth/register", method: .post, parameters: RegisterStruct, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: TokenType.self) { res in
                debugPrint(res)
                success()
            }
            .responseString { res in
                self.error1 = res.value ?? ""
                debugPrint(res)
                error()
            }
    }
    func GetVersion(success: @escaping () -> Void) {
        AF.request("https://food.madskill.ru/dishes/version", method: .get)
            .responseDecodable(of: Version.self) { res in
                self.versions = res.value?.version ?? []
                debugPrint(res)
                success()
            }
    }
    func GetDishes(success : @escaping () -> Void) {
        versions.forEach { version in
            AF.request("https://food.madskill.ru/dishes?version=\(version)", method: .get)
                .responseDecodable(of: [Dishes].self) { res in
                    self.dishes += res.value ?? []
                    success()
                    
                }
        }
    }
}
