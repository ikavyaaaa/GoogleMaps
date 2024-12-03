//
//  Geocode.swift
//  eprice-label
//
//  Created by Kavya Krishna K. on 03/12/24.
//

import Foundation


struct Geocode : Codable {
    let plusCode : PlusCode?
    let results : [PlacemarkResults]?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case plusCode = "plus_code"
        case results = "results"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        plusCode = try values.decodeIfPresent(PlusCode.self, forKey: .plusCode)
        results = try values.decodeIfPresent([PlacemarkResults].self, forKey: .results)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

struct PlacemarkResults : Codable {
    let addressComponents : [AddressComponents]?
    let formattedAddress : String?
    let geometry : Geometry?
    let placeId : String?
    let plusCode : PlusCode?
    let types : [String]?

    enum CodingKeys: String, CodingKey {

        case addressComponents = "address_components"
        case formattedAddress = "formatted_address"
        case geometry = "geometry"
        case placeId = "place_id"
        case plusCode = "plus_code"
        case types = "types"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        addressComponents = try values.decodeIfPresent([AddressComponents].self, forKey: .addressComponents)
        formattedAddress = try values.decodeIfPresent(String.self, forKey: .formattedAddress)
        geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
        placeId = try values.decodeIfPresent(String.self, forKey: .placeId)
        plusCode = try values.decodeIfPresent(PlusCode.self, forKey: .plusCode)
        types = try values.decodeIfPresent([String].self, forKey: .types)
    }

}

struct Location : Codable {
    let lat : Double?
    let lng : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }

}

struct Northeast : Codable {
    let lat : Double?
    let lng : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }

}

struct PlusCode : Codable {
    let compoundCode : String?
    let globalCode : String?

    enum CodingKeys: String, CodingKey {

        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        compoundCode = try values.decodeIfPresent(String.self, forKey: .compoundCode)
        globalCode = try values.decodeIfPresent(String.self, forKey: .globalCode)
    }

}


struct Southwest : Codable {
    let lat : Double?
    let lng : Double?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }

}

struct Viewport : Codable {
    let northeast : Northeast?
    let southwest : Southwest?

    enum CodingKeys: String, CodingKey {

        case northeast = "northeast"
        case southwest = "southwest"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        northeast = try values.decodeIfPresent(Northeast.self, forKey: .northeast)
        southwest = try values.decodeIfPresent(Southwest.self, forKey: .southwest)
    }

}

struct AddressComponents : Codable {
    let longName : String?
    let shortName : String?
    let types : [String]?

    enum CodingKeys: String, CodingKey {

        case longName = "long_name"
        case shortName = "short_name"
        case types = "types"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        longName = try values.decodeIfPresent(String.self, forKey: .longName)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
        types = try values.decodeIfPresent([String].self, forKey: .types)
    }

}

struct Geometry : Codable {
    let location : Location?
    let locationType : String?
    let viewport : Viewport?

    enum CodingKeys: String, CodingKey {

        case location = "location"
        case locationType = "location_type"
        case viewport = "viewport"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        locationType = try values.decodeIfPresent(String.self, forKey: .locationType)
        viewport = try values.decodeIfPresent(Viewport.self, forKey: .viewport)
    }

}


struct GoogleTimeZone : Codable {
    let dstOffset : Int?
    let rawOffset : Int?
    let status : String?
    let timeZoneId : String?
    let timeZoneName : String?

    enum CodingKeys: String, CodingKey {

        case dstOffset = "dstOffset"
        case rawOffset = "rawOffset"
        case status = "status"
        case timeZoneId = "timeZoneId"
        case timeZoneName = "timeZoneName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dstOffset = try values.decodeIfPresent(Int.self, forKey: .dstOffset)
        rawOffset = try values.decodeIfPresent(Int.self, forKey: .rawOffset)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        timeZoneId = try values.decodeIfPresent(String.self, forKey: .timeZoneId)
        timeZoneName = try values.decodeIfPresent(String.self, forKey: .timeZoneName)
    }

}
