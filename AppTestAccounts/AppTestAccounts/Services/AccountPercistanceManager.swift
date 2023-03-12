//
//  AccountPercistanceManager.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 9/3/23.
//

import CoreData
import UIKit

protocol AccountPercistanceManagerProtocol {
    func saveLastAccountsToCoreData(accounts: [Account])
    func loadAccountsFromCoreData() -> [Account]?
}

final class AccountPercistanceManager {
    private var persistentContainer: NSPersistentContainer
    private let accountsEntityName = "Accounts"
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
}

extension AccountPercistanceManager: AccountPercistanceManagerProtocol {
    /// Stores the current accounts to a `Core Data` entity named `Accounts`.
    ///
    /// - Parameters:
    ///     - accounts: The accounts to store.
    func saveLastAccountsToCoreData(accounts: [Account]) {
        clearCoreDataAccountsEntity()
        accounts.forEach { account in
            if let entity = NSEntityDescription.entity(forEntityName: accountsEntityName, in: persistentContainer.viewContext),
                let amount = account.amount.encode() {
                let accountData = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
                accountData.setValue(account.accountId, forKeyPath: "accountId")
                accountData.setValue(amount, forKeyPath: "amount")
                accountData.setValue(account.companyName, forKeyPath: "companyName")
                accountData.setValue(account.creditDebitIndicator, forKeyPath: "creditDebitIndicator")
                accountData.setValue((account.datetime), forKeyPath: "datetime")
            }
        }
        
        do {
            try persistentContainer.viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    /// Load the accounts sotred in `Core Data.
    ///
    /// - Returns: The accounts that where stored in ´Core Data´ or nil if there aren't any.
    func loadAccountsFromCoreData() -> [Account]? {
        var accounts: [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: accountsEntityName)
        
        do {
            accounts = try persistentContainer.viewContext.fetch(fetchRequest)
            return accounts.map {
                let accountId = $0.value(forKey: "accountId") as? String ?? ""
                let amountData = $0.value(forKey: "amount") as? Data
                let amount = Amount.decode(amountData) ?? Amount(amount: "", currency: "", currencyName: "")
                let companyName = $0.value(forKey: "companyName") as? String ?? ""
                let creditDebitIndicator = $0.value(forKey: "creditDebitIndicator") as? String ?? ""
                let datetime = $0.value(forKey: "datetime") as? String ?? ""

                return Account(accountId: accountId,
                               companyName: companyName,
                               amount: amount,
                               creditDebitIndicator: creditDebitIndicator,
                               datetime: datetime)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
}

private extension AccountPercistanceManager {
    /// Clears all the data soted in the `Core Data` entity `accounts`
    func clearCoreDataAccountsEntity() {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: accountsEntityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            try persistentContainer.viewContext.save()
        } catch let error as NSError {
            print("There was an error deleting data. \(error), \(error.userInfo)")
        }
    }
}
