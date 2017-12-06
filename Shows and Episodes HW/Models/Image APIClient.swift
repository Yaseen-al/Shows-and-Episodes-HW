//
//  Image APIClient.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
import UIKit
struct ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func getImage(from urlStr: String, completionHandler: @escaping (UIImage)->Void, errorHandler: @escaping (Error)->Void){
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badURL)
            return
        }
        let completionHandler: (Data)->Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                errorHandler(AppError.notAnImage)
                return
            }
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completionHandler, errorHandler: {print($0)})
    }
}
