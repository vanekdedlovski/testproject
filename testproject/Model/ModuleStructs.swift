//
//  ModuleStructs.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import Foundation
import Alamofire

struct Login : Codable {
    let email : String
    let password : String
}
struct TokenType : Codable {
    let token : Int
}
struct Register : Codable {
    let email : String
    let password  : String
    let login : String
}
struct Version : Codable {
    let version : [String]?
}
struct Dishes : Codable {
    let dishId : String
    var category : String
    let nameDish : String
    let price : String
    let icon : String
    let version : String
}
