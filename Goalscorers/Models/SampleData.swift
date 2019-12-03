//
//  SampleData.swift
//  Goalscorers
//
//  Created by tichinose1 on 2019/12/03.
//  Copyright © 2019 tichinose1. All rights reserved.
//

import Foundation

enum SampleData {

    static let scorers = Scorer.samples.toDocs()
    static let overallScorers = OverallScorer.samples.toDocs()
    static let players = Player.samples.toDocs()
    static let competitions = Competition.samples.toDocs()
    static let associations = Association.samples.toDocs()
}

extension Array where Element: Decodable {
    func toDocs() -> [Doc<Element>] {
        enumerated().map { offset, element in
            element.toDoc(offset: offset)
        }
    }
}

extension Decodable {
    func toDoc(offset: Int) -> Doc<Self> {
        Doc<Self>(documentID: "\(offset)", reference: nil, data: self)
    }
}

extension Scorer {
    static let samples: [Scorer] = [
        .init(
            url: URL(string: "https://en.wikipedia.org/wiki/2004_Copa_Am%C3%A9rica#Goal_scorers")!,
            title: "2004 Copa América",
            season: "2004",
            order: 0
        )
    ]
}
extension OverallScorer {
    static let samples: [OverallScorer] = [
        .init(
            url: URL(string: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players")!,
            order: 0
        )
    ]
}
extension Player {
    static let samples: [Player] = [
        .init(
            url: URL(string: "https://en.wikipedia.org/wiki/Cristiano_Ronaldo#Career_statistics")!,
            name: "Cristiano Ronaldo",
            order: 0,
            associationRef: nil
        )
    ]
}
extension Competition {
    static let samples: [Competition] = [
        .init(
            name: "Ligue 1",
            kind: "club",
            order: 0,
            associationRef: nil
        )
    ]
}

import Firebase

extension Association {
    static let samples: [Association] = [
        .init(
            regionCode: "KR",
            name: "South Korea",
            coordinate: GeoPoint(latitude: 37.55, longitude: 126.966667),
            order: 0
        )
    ]
}
