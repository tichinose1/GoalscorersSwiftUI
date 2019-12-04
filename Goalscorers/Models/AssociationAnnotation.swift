//
//  AssociationAnnotation.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/25.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import MapKit

final class AssociationAnnotation: MKPointAnnotation {
    let association: Doc<Association>

    init(association: Doc<Association>) {
        self.association = association

        super.init()

        self.coordinate = CLLocationCoordinate2D(latitude: association.data.coordinate.latitude, longitude: association.data.coordinate.longitude)
        self.title = association.data.name
    }
}
