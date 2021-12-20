//
//  Home.swift
//  DriveU
//
//  Created by Neelam's Macbook Pro on 18/12/21.
//

import Foundation
import ObjectMapper

struct Home: Mappable{
    var status: String?
    var feeds:[Feed]?
    var greetingMessage: String?
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        feeds <- map["feeds"]
        greetingMessage <- map["greetingMessage"]
    }
}

struct Feed: Mappable{
    var screen: String?
    var car: Car?
    var features: [Feature]?
    var offers: [Offer]?
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        screen <- map["screen"]
        car <- map["car"]
        features <- map["features"]
        offers <- map["offers"]
    }
}

struct Car: Mappable{
    var image: String?
    var regNo: String?
    var fuelType: String?
    var transmission: String?
    var make: String?
    var model: String?
    var car_id: String?
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        image <- map["image"]
        regNo <- map["regNo"]
        fuelType <- map["fuelType"]
        transmission <- map["transmission"]
        make <- map["make"]
        model <- map["model"]
        car_id <- map["car_id"]
    }
}

struct Feature: Mappable{
    var imageUrl: String?
    var screenName: String?
    var redirectUrl: String?
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        imageUrl <- map["imageUrl"]
        screenName <- map["screenName"]
        redirectUrl <- map["redirectUrl"]
    }
}

struct Offer: Mappable{
    var image: String?
    var screen_name: String?
    var name: String?
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        image <- map["image"]
        screen_name <- map["screen_name"]
        name <- map["name"]
    }
}
