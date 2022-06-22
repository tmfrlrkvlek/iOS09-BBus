//
//  Station+CoreDataProperties.swift
//  BBus
//
//  Created by 이지수 on 2022/06/22.
//
//

import Foundation
import CoreData


extension Station {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Station> {
        return NSFetchRequest<Station>(entityName: "Station")
    }

    @NSManaged public var stationID: Int32
    @NSManaged public var arsID: String
    @NSManaged public var stationName: String

}

extension Station : Identifiable {

}
