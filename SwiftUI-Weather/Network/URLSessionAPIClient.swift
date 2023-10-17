//
//  URLSessionAPIClient.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 16/10/23.
//

import Foundation
import Combine

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key)}
        endpoint.parameters?.forEach { request.addValue($0.value as! String, forHTTPHeaderField: $0.key)}
        
        return URLSession.shared.dataTaskPublisher(
            for: URLRequest(
                url: URL(
                    string: "https://api.weatherapi.com/v1/forecast.json?q=Brasilia&key=de2cb2587c984bf6b4432708231710&days=7")!
            )
        )
        .subscribe(on: DispatchQueue.main)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print(response)
                throw APIError.invalidResponse
            }
            return data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
}
