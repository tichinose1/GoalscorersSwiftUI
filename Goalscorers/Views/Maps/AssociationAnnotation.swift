//
//  AssociationAnnotation.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/25.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import MapKit
import Firebase

final class AssociationAnnotation: MKPointAnnotation {

    init(association: DocumentSnapshot) {
        super.init()

        self.coordinate = association.coordinate
        self.title = association.name
    }
}

private extension DocumentSnapshot {

    var coordinate: CLLocationCoordinate2D {
        (data()!["coordinate"] as! GeoPoint).cordinate
    }

    var name: String {
        data()!["name"] as! String
    }
}

private extension GeoPoint {

    var cordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
