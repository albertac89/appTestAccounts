//
//  MainViewModel.swift
//  AppTestAccounts
//
//  Created by Albert Aige Cortasa on 7/3/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var navState: MainNav = .home
}

enum MainNav {
    case home
    case products
}
