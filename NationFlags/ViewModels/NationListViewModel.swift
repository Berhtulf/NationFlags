//
//  NationListViewModel.swift
//  NationFlags
//
//  Created by Martin Václavík on 20.03.2021.
//  Copyright © 2021 Martin Václavík. All rights reserved.
//

import SwiftUI
import Combine

class NationListViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var showSearch = false

    @Published var nationList = Nation.list

    var searchCancellable: AnyCancellable?

    init() {
        searchCancellable = $search
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { $0 }
            .sink { str in
                self.filterList(search: str)
            }
    }

    private func filterList(search: String) {
        if search.isEmpty {
            nationList = Nation.list.sorted {
                NSLocalizedString($0.name, comment: "").localizedCaseInsensitiveCompare(NSLocalizedString($1.name, comment: "")) == .orderedAscending
            }
        } else {
            nationList = Nation.list.filter {
                NSLocalizedString($0.name, comment: "").localizedCaseInsensitiveContains(search)
                || NSLocalizedString($0.capital, comment: "").localizedCaseInsensitiveContains(search)
            }
        }
    }
}
