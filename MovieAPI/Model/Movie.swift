//
//  Movie.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit


struct ResponseFirst : Codable {
    let boxOfficeResult : Response
}

struct Response : Codable {
    let boxofficeType : String
    let showRange : String
    let dailyBoxOfficeList : [MovieApi]
}

struct MovieApi : Codable {
    let title : String
    var audi : String
    var sales : String
    var code :  String
    
    enum CodingKeys : String, CodingKey {
        case title = "movieNm"
        case audi = "audiAcc"
        case sales = "salesAcc"
        case code = "movieCd"
    }
    
    
    
}
