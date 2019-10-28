//
//  AssociationAnnotation.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/25.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import MapKit

final class AssociationAnnotation: MKPointAnnotation {

    init(association: Association) {
        super.init()

        self.coordinate = association.coordinate
        self.title = association.name
    }
}
