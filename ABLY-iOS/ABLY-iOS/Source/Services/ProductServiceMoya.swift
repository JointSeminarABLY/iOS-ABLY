//
//  ProductServiceMoya.swift
//  ABLY-iOS
//
//  Created by SHIN YOON AH on 2021/06/11.
//

import Foundation
import Moya

enum ProductServices {
    case product
    case onepiece
}

extension ProductServices: TargetType {
  public var baseURL: URL {
    return URL(string: APIConstants.baseURL)!
  }
  
  var path: String {
    switch self {
    case .product:
        return "/Product"
    case .onepiece:
        return "/Product/Onepiece"
    }
  }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .product,
             .onepiece:
            return URLEncoding.default
        }
    }
  
  var method: Moya.Method {
    switch self {
    case .product,
         .onepiece:
      return .get
    }
  }
  
  var sampleData: Data {
    return "@@".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case .product,
         .onepiece:
        return .requestPlain
    }
  }

  var headers: [String: String]? {
    switch self {
    default:
        return ["Content-Type": "application/json"]
    }
  }
}
