//
//  MainViewModel.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import Combine

protocol MainViewModelProtocol {
    func getAccounts()
    func showAllAcountsIfNeeded()
}

class MainViewModel: ObservableObject {
    private var allAcounts = [Account]()
    @Published var accounts = [Account]()
    @Published var navState: MainNav = .home
    @Published var isMenuVisible = false
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var viewAllText = "View all"
    @Published var viewAll = false
    
    private var accountService: AccountServiceProtocol
    private var subscribers = Set<AnyCancellable>()
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
}

extension MainViewModel: MainViewModelProtocol {
    func getAccounts() {
        isLoading = true
        accountService.getAccounts().sink { completion in
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.showError = true
                self.isLoading = false
            case .finished:
                self.isLoading = false
            }
            return
        } receiveValue: { accounts in
            self.allAcounts = accounts
            self.showAllAcountsIfNeeded()
        }
        .store(in: &subscribers)
    }
    
    func showAllAcountsIfNeeded() {
        viewAllText = viewAll ? "View less" : "View all"
        if viewAll {
            accounts = allAcounts
        } else {
            accounts = Array(allAcounts.prefix(3))
        }
    }
}
