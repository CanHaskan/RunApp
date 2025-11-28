//
//  Run.swift
//  RunApp
//
//  Created by Can Haskan on 26.11.2025.
//

import Foundation
import RealmSwift

class Run: Object {
    
    @Persisted(primaryKey: true) var id: String
    @Persisted var date: Date
    @Persisted var speed: Int
    @Persisted var distance: Double
    @Persisted var duration: Int
    @Persisted var locations = List<Location>()
    
    override class nonisolated func primaryKey() -> String? {
        return "id"
    }
    
    override class nonisolated func indexedProperties() -> [String] {
        return ["speed", "date", "duration"]
    }
    
    convenience init(speed: Int, distance: Double, duration: Int, locations: List<Location>) {
        self.init()
        self.id = UUID().uuidString.lowercased()
        self.date = Date()
        self.speed = speed
        self.distance = distance
        self.duration = duration
        self.locations = locations
    }
    
    static func addRunToRealm(speed: Int, distance: Double, duration: Int, locations: List<Location>) {
        REALM_QUEUE.sync {
            let run = Run(speed: speed, distance: distance, duration: duration, locations: locations)
            do {
                let realm = try Realm(configuration: RealmConfig.runDataConfig)
                try realm.write{
                    realm.add(run)
                    try realm.commitWrite()
                }
            } catch {
                debugPrint("Error adding run to realm")
            }
        }
    }
    
    static func getAllRuns() -> Results<Run>? {
        do {
            let realm = try Realm(configuration: RealmConfig.runDataConfig)
            var runs = realm.objects(Run.self)
            runs = runs.sorted(byKeyPath: "date", ascending: false)
            return runs
        } catch {
            return nil
        }
    }
}













