//
//  Location.swift
//  RunApp
//
//  Created by Can Haskan on 28.11.2025.
//

import Foundation
import RealmSwift

class Location: Object {
    @Persisted var latitude: Double
    @Persisted var longitude: Double
    
    convenience init (latitude: Double, longitude: Double){
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }

}
