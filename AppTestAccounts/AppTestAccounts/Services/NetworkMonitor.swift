//
//  NetworkMonitor.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import Network

protocol NetworkMonitorProtocol {
    var isNetworkAvailable: Bool { get }
}

final class NetworkMonitor: NetworkMonitorProtocol {
    private var monitor: NWPathMonitor
    private var queue = DispatchQueue.global()
    var isNetworkAvailable = false
    
    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.monitor.start(queue: queue)
        startMonitoring()
    }
    
    deinit {
        monitor.cancel()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isNetworkAvailable = true
           } else {
                self.isNetworkAvailable = false
           }
        }
    }
}
