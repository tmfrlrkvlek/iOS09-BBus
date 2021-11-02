//
//  SearchBusPushable.swift
//  BBus
//
//  Created by Kang Minsang on 2021/11/02.
//

import Foundation

protocol SearchBusPushable: Coordinator {
    func pushToSearchBus()
}

extension SearchBusPushable {
    func pushToSearchBus() {
        let coordinator = SearchBusCoordinator(presenter: self.presenter)
        coordinator.delegate = self
        self.childCoordinators.append(coordinator)
        coordinator.start()
    }
}
