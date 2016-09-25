//
//  Created by Abel Orosz on 2016-09-22.
//  Copyright © 2016. Abel Orosz. All rights reserved.
//

import Moya
import UIKit
import CoreLocation

public enum APIEndpoints {
    case current(location: CLLocation)
    case forecast(location: CLLocation)
}

extension APIEndpoints: TargetType {
    
    public var baseURL: URL { return URL(string: "http://api.openweathermap.org/data/2.5")! }
    
    public var path: String {
        switch self {
            case .current(_): return "/weather"
            case .forecast(_): return "/forecast"
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    public var parameters: [String: Any]? {
        switch self {
            case .current(let location):
                return [
                    "lat": location.coordinate.latitude,
                    "lon": location.coordinate.longitude
                ]
            case .forecast(let location):
                return [
                    "lat": location.coordinate.latitude,
                    "lon": location.coordinate.longitude
                ]
        }
    }
    
    public var task: Task { return .request }
    public var multipartBody: [MultipartFormData]? { return nil }
    public var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    
}

let endpointClosure = { (target: APIEndpoints) -> Endpoint<APIEndpoints> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    var endpoint = Endpoint<APIEndpoints>(URL: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
    endpoint = endpoint.endpointByAddingParameters(["appid": "80db27919a5b15bf334c1818707466ee"])
    
    return endpoint
}

let API = MoyaProvider<APIEndpoints>(endpointClosure: endpointClosure)
