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
    
    /// Starts monitoring the network connection and updates the state of `isNetworkAvailable`.
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            if path.status == .satisfied {
                self.isNetworkAvailable = true
            } else {
                self.isNetworkAvailable = false
            }
        }
    }
}
