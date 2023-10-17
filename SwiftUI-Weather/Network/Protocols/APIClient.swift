//
//  APIClient.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 16/10/23.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
