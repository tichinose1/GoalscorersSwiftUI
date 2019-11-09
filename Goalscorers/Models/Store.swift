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

    var selectedAssociationTitle: String? = nil {
        didSet {
            isAssociationSelected = (selectedAssociationTitle != nil)
        }
    }

    func selectAssociation(title: String) {
        selectedAssociationTitle = title
    }
}
