# GoalscorersSwiftUI

T.B.D.

## 初期セットアップ

```sh
bundle
bundle exec pod install
```

## ライブラリ更新

```sh
bundle update
bundle exec pod update
./Pods/LicensePlist/license-plist --output-path Cetti/Settings.bundle
```

## 静的コード分析実行

```sh
./Pods/SwiftLint/swiftlint
```

## テスト実行（未実装

```sh
bundle exec fastlane test
```

## ベータ配布（未実装

```sh
bundle exec fastlane beta
```

## 配布（未実装

```sh
bundle exec fastlane release
```

## Firebase

- ModelにFirebaseの依存を閉じ込めて、ViewはFirebaseに依存しないようにする

```swift
import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Scorer: Decodable {
    var url: URL
    var title: String
    var season: String
    var order: Int
    var competitionRef: DocumentReference?

    private enum CodingKeys: String, CodingKey {
        case url
        case title
        case season
        case order
        case competitionRef = "competition_ref"
    }
}
```

```swift
import SwiftUI

struct Current: View {
    @State private(set) var items: [Scorer] = []
    @State private var isSafariViewPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isSafariViewPresented = true }) {
                    CurrentRow(item: item)
                }
                .sheet(isPresented: self.$isSafariViewPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Current season")
        }
        .onAppear {
            self.onAppear()
        }
    }
}
```

