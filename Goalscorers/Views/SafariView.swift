//
//  SafariView.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/10/11.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import SwiftUI
import UIKit
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        print(#function)
    }
}
