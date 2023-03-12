//
//  HomeViewModelBuilder.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import Foundation
import CoreData

final class HomeViewModelBuilder {
    static let shared = HomeViewModelBuilder()
    
    /// Generates a `HomeViewModel` with all his dependencies.
    ///
    /// - Returns: A `HomeViewModel`.
    func build() -> HomeViewModel {
        let persistentContainer = NSPersistentContainer(name: "AppTestAccounts")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error: \(error), \(error.userInfo)")
            }
        })
        let client = URLSession.shared
        let networkMonitor = NetworkMonitor()
        let percistanceManager = AccountPercistanceManager(persistentContainer: persistentContainer)
        let service = AccountService(client: client,
                                     networkMonitor: networkMonitor,
                                     accountPercistanceManager: percistanceManager,
                                     errorHandler: ErrorHandler())
        return HomeViewModel(accountService: service)
    }
}
