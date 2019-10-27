# GoalscorersSwiftUI

## Firebase

- ModelにFirebaseの依存を閉じ込めて、ViewはFirebaseに依存しないようにする
- 一方でModel定義はFirebaseに依存させず、extensionで依存させる

```swift
struct Scorer: Identifiable {
    var id: String
    var data: [String: Any]
}
```

```swift
import Firebase

extension Scorer {

    static func getLatestScorers(completion: @escaping (Result<[Scorer], GoalscorersError>) -> Void) {
        Firestore
            .firestore()
            .collection("scorers")
            .addSnapshotListener { snapshot, error in
            ...
        }
    }

    var name: String {
        data["title"] as! String
    }

    var url: URL {
        URL(string: data["url"] as! String)!
    }

    func getCompetition(completion: @escaping (Result<Competition, GoalscorersError>) -> Void) {
        let competitionRef = data["competition_ref"] as! DocumentReference
        competitionRef.getDocument { snapshot, error in
            ...
        }
    }
}
```

```swift
import SwiftUI

struct Current: View {
    @State private var items: [Scorer] = []
    @State private var isPresented = false

    var body: some View {
        NavigationView {
            List(items) { item in
                Button(action: { self.isPresented = true }) {
                    ScorerRow(item: item)
                }
                .sheet(isPresented: self.$isPresented) {
                    SafariView(url: item.url)
                }
            }
            .navigationBarTitle("Current season")
        }
        .onAppear { self.onAppear() }
    }
}

private extension Current {

    func onAppear() {
        Scorer.getLatestScorers { result in
            ...
        }
    }
}
```
