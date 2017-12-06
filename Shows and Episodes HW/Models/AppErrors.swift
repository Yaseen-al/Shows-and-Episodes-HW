//
//  AppErrors.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/3/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case other(rawError: Error)
    case notAnImage
}
