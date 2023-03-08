//
//  AppTestAccountsApp.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 6/3/23.
//

import SwiftUI

@main
struct AppTestAccountsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(accountService: AccountService(client: URLSession.shared)))
        }
    }
}
