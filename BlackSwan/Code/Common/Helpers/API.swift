//
//  Created by Abel Orosz
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
    
    private var appid: String { return "80db27919a5b15bf334c1818707466ee" }
    public var baseURL: URL { return URL(string: "http://api.openweathermap.org/data/2.5")! }
    
    public var path: String {
        switch self {
        case .current: return "/weather"
        case .forecast: return "/forecast"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .current(let location):
            let parameters: [String: Any] = [
                "lat": location.coordinate.latitude,
                "lon": location.coordinate.longitude,
                "appid": self.appid
            ]
            
            return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .forecast(let location):
            let parameters: [String: Any] = [
                "lat": location.coordinate.latitude,
                "lon": location.coordinate.longitude,
                "appid": self.appid
            ]
            
            return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? { return nil }
    public var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    public var validationType: ValidationType { return .none }
	public var parameterEncoding: ParameterEncoding { return URLEncoding.default }
    
}

let API = MoyaProvider<APIEndpoints>()
