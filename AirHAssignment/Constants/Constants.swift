//
//  Constants.swift
//  HeadyECommerce
//
//  Created by Nirav Hathi on 7/3/20.
//  Copyright © 2020 Nirav Hathi. All rights reserved.
//

import Foundation
import SwiftyJSON
enum Constants {
    static let baseURL = "https://rosterbuster.aero/"
    static let endPoint = "wp-content/uploads/dummy-response.json"
}
enum Result{
    case Success(JSON)
    case Error(String)
}
