//
//  BusRoute+CoreDataProperties.swift
//  BBus
//
//  Created by 이지수 on 2022/06/22.
//
//

import Foundation
import CoreData

extension BusRoute {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BusRoute> {
        return NSFetchRequest<BusRoute>(entityName: "BusRoute")
    }

    @NSManaged public var routeID: Int32
    @NSManaged public var busRouteName: String?
    @NSManaged public var routeStringType: String?
    @NSManaged public var startStation: String?
    @NSManaged public var endStation: String?

}

extension BusRoute : Identifiable {

}
