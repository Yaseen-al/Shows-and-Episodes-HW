//
//  Episode APIClient.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct EpisodeAPIClient {
    private init() {}
    static let manager = EpisodeAPIClient()
    func getContacts(from urlStr: String, completionHandler: @escaping ([Episode]) -> Void, errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let episodes = try JSONDecoder().decode([Episode].self, from: data)
                completionHandler(episodes)
            }
            catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}
