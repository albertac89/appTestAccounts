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
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppTestAccounts")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error: \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    private let accountsEntityName = "Accounts"
}

extension AccountPercistanceManager: AccountPercistanceManagerProtocol {
    func saveLastAccountsToCoreData(accounts: [Account]) {
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
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
