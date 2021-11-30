//
//  createFavoriteItem.swift
//  BBus
//
//  Created by Kang Minsang on 2021/12/01.
//

import Foundation
import Combine

extension BBusAPIUseCases: CreateFavoriteItemUsable {
    func createFavoriteItem(param: FavoriteItemDTO) -> AnyPublisher<Data, Error> {
        let fetcher: CreateFavoriteItemFetchable = PersistenceCreateFavoriteItemFetcher(persistenceStorage: self.persistenceStorage)
        return fetcher
            .fetch(param: param)
            .tryCatch({ error -> AnyPublisher<Data, Error> in
                return fetcher
                    .fetch(param: param)
            })
            .retry(TokenManager.maxTokenCount)
            .eraseToAnyPublisher()
    }
}
