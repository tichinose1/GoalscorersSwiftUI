//
//  Store.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/11/09.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

final class Store: ObservableObject {
    @Published var isAssociationSelected: Bool = false

    var selectedAssociationID: String? = nil {
        didSet {
            isAssociationSelected = (selectedAssociationID != nil)
        }
    }

    func selectAssociation(id: String?) {
        selectedAssociationID = id
    }
}
