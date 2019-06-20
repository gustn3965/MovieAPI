//
//  MovieDetail.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit
struct ResponseFirstDatail : Codable {
    let movieInfoResult : ResponseDatial
}

struct ResponseDatial : Codable {
    let movieInfo : Detail
    let source : String
    
}

struct Detail : Codable {
    let title  : String
    let openDt : String!
    let count : String!
    let nations : [Nations]
    let actors : [Actors]
    let directors : [Directors]
    let audits : [Audits]
    let staffs : [Staffs]
    let companys : [Companys]
    
 
    enum CodingKeys : String, CodingKey {
        case title = "movieNm"
        case openDt = "openDt"
        case count = "showTm"
        case nations = "nations"
        case actors = "actors"
        case directors = "directors"
        case audits = "audits"
        case staffs = "staffs"
        case companys = "companys"
    }
}

struct Nations : Codable {
    let nationNm : String
}
struct Genres : Codable {
    let genreNm : String
}
struct Directors : Codable {
    let peopleNm : String
}
struct Actors : Codable {
    let peopleNm : String
}
struct Audits : Codable{
    let watchGradeNm : String
}

struct Staffs : Codable {
    let peopleNm : String
}

struct Companys : Codable {
    let companyNm : String
    let companyPartNm : String
    
    
    
}
