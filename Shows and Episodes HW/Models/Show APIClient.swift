//
//  Show APIClient.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/3/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct ShowAPIClient {
    private init() {}
    static let manager = ShowAPIClient()
    func getShows(from urlStr: String, completionHandler: @escaping ([Show]) -> Void, errorHandler: @escaping (AppError) -> Void) {
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let shows = try JSONDecoder().decode([Show].self, from: data)
                completionHandler(shows)
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
