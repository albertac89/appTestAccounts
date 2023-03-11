//
//  MainViewModel.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import Combine

protocol HomeViewModelProtocol {
    func getAccounts()
    func showAllAcountsIfNeeded()
}

final class HomeViewModel: ObservableObject {
    private var allAcounts = [Account]()
    @Published var accounts = [Account]()
    @Published var isMenuVisible = false
    @Published var isLoading = false
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var viewAllText = "View all"
    @Published var viewAll = false
    
    private var accountService: AccountServiceProtocol
    private var subscribers = Set<AnyCancellable>()
    
    /// Inejcts the dependencies needed for `HomeViewModel`.
    ///
    /// - Parameters:
    ///     - accountService: A `Class` that conforms the protocol`AccountServiceProtocol`.
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    /// To obtain the accounts to display.
    func getAccounts() {
        isLoading = true
        accountService.getAccounts().sink { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.showError = true
                self.isLoading = false
            case .finished:
                self.isLoading = false
            }
            return
        } receiveValue: { [weak self] accounts in
            guard let self = self else { return }
            self.allAcounts = accounts
            self.showAllAcountsIfNeeded()
        }
        .store(in: &subscribers)
    }
    
    /// Depending on the `viewAll` Bool value you will see 3 accounts for `false` and all the accounf for `true`.
    func showAllAcountsIfNeeded() {
        viewAllText = viewAll ? "View less" : "View all"
        if viewAll {
            accounts = allAcounts
        } else {
            accounts = Array(allAcounts.prefix(3))
        }
    }
}
