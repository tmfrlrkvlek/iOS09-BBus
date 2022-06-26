//
//  AppDelegate.swift
//  BBus
//
//  Created by Kang Minsang on 2021/10/26.
//

import UIKit
import CoreData

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocalStorage")
        container.loadPersistentStores() { (storeDecription, error) in
            if let error = error {
                fatalError("error\((error as NSError).userInfo)")
            }
        }
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        let request = Station.fetchRequest()
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "stationID LIKE %@", "100000014")])
        if let data =  try? self.persistentContainer.viewContext.fetch(request) {
            data.forEach({ item in
                print(item.stationID)
                print(item.stationName)
            })
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
//        let resource: String? = "BusRouteList"
//        let type: String? = "json"
//        let busRouteList = try! String(contentsOf: Bundle.main.url(forResource: resource, withExtension: type)!).data(using: .utf8)!
//        let data = try! JSONDecoder().decode([BusRouteDTO].self, from: busRouteList)
//
//        let context = self.persistentContainer.viewContext
//        var itemArray = (try? context.fetch(BusRoute.fetchRequest())) ?? [BusRoute]()
//        data.forEach() { item in
//            let newItem = BusRoute(context: context)
//            newItem.routeID = Int32(item.routeID)
//            newItem.busRouteName = item.busRouteName
//            newItem.routeStringType = item.routeType.rawValue
//            newItem.startStation = item.startStation
//            newItem.endStation = item.endStation
//            itemArray.append(newItem)
//        }
//        print(itemArray)
//        do {
//            try context.save()
//            print("save complete")
//        } catch {
//            print("error occurs")
//        }
//
//        let resource2: String? = "StationList"
//        let type2: String? = "json"
//        let stationList = try! String(contentsOf: Bundle.main.url(forResource: resource2, withExtension: type2)!).data(using: .utf8)!
//        let data2 = try! JSONDecoder().decode([StationDTO].self, from: stationList)
//
//        var itemArray2 = (try? context.fetch(Station.fetchRequest())) ?? [Station]()
//        data2.forEach() { item in
//            let newItem = Station(context: context)
//            newItem.stationID = Int32(item.stationID)
//            newItem.arsID = item.arsID
//            newItem.stationName = item.stationName
//            itemArray2.append(newItem)
//        }
//        print(itemArray2)
//        do {
//            try context.save()
//            print("save complete")
//        } catch {
//            print("error occurs")
//        }
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
}
