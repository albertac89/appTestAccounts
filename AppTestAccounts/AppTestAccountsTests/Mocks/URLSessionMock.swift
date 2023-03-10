//
//  URLSessionMock.swift
//  AppTestAccountsTests
//
//  Created by Albert Aige Cortasa on 10/3/23.
//

import Foundation

final class URLSessionMock {
    static var mock: URLSession {
        let configurationWithMock = URLSessionConfiguration.default
        configurationWithMock.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: configurationWithMock)
    }
}
