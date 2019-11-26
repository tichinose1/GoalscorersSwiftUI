//
//  AssociationAnnotation.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/25.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import MapKit

final class AssociationAnnotation: MKPointAnnotation {
    let associationID: String

    init(association: Association) {
        self.associationID = association.id

        super.init()

        self.coordinate = CLLocationCoordinate2D(latitude: association.coordinate.latitude, longitude: association.coordinate.longitude)
        self.title = association.name
    }
}
