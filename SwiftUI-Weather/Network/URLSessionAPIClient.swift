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
        var urlComponents = URLComponents(string: endpoint.baseURL.appendingPathComponent(endpoint.path).description)
        
        var queryItems = [URLQueryItem]()
        endpoint.parameters?.forEach { queryItems.append(URLQueryItem(name: $0.key, value: $0.value as? String)) }
        
        urlComponents?.queryItems = queryItems
        
        var request = URLRequest(url: (urlComponents?.url)!)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key)}
        
        return URLSession.shared.dataTaskPublisher(for: request)
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
