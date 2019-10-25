//
//  MapView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/22.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import MapKit
import Firebase

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView

    @Binding var associations: [QueryDocumentSnapshot]

    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }
}

private extension MapView {

    func updateAnnotations(from mapView: MKMapView) {
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 47.381389, longitude: 8.574444)

        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = associations.map(AssociationAnnotation.init)
        mapView.addAnnotations(newAnnotations)
    }
}
