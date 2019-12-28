//
//  Match.swift
//  Racquetball WatchKit Extension
//
//  Created by Austin Conlon on 12/18/19.
//  Copyright © 2019 Austin Conlon. All rights reserved.
//

import Foundation

enum Format {
    case singles, doubles
}

enum Team: CaseIterable {
    case one, two
}

struct Match {
    let teamOne = Team.one
    let teamTwo = Team.two
    
    var minimumPointsToWinGame = 15
    
    /// Best-of three series of games in match.
    let minimumGamesToWinMatch = 2
    
    var teamGameScores = [0, 0]
    
    var teamMatchScores = [0, 0] {
        didSet {
            if winner == nil { teamGameScores = [0, 0] }
            if teamMatchScores == [1, 1] { minimumPointsToWinGame = 11 }
        }
    }
    
    var server = Team.allCases.randomElement()
    
    var winner: Team?
    
    mutating func switchServer() {
        switch server! {
        case .one:
            server = .two
        case .two:
            server = .one
        }
    }
    
    mutating func winRally(for team: Team) {
        if team == server {
            incrementGameScore(for: team)
            checkGameWinCondition(for: team)
        } else {
            switchServer()
        }
        
        checkMatchWinCondition(for: team)
    }
    
    mutating func incrementGameScore(for team: Team) {
        switch team {
        case .one:
            teamGameScores[0] += 1
        case .two:
            teamGameScores[1] += 1
        }
    }
    
    mutating func incrementMatchScore(for team: Team) {
        switch team {
        case .one:
            teamMatchScores[0] += 1
        case .two:
            teamMatchScores[1] += 1
        }
    }
    
    mutating func checkGameWinCondition(for team: Team) {
        switch team {
        case .one:
            if teamGameScores[0] >= minimumPointsToWinGame { incrementMatchScore(for: team) }
        case .two:
            if teamGameScores[1] >= minimumPointsToWinGame { incrementMatchScore(for: team) }
        }
    }
    
    mutating func checkMatchWinCondition(for team: Team) {
        switch team {
        case .one:
            if teamMatchScores[0] >= minimumGamesToWinMatch { winner = team }
        case .two:
            if teamMatchScores[1] >= minimumGamesToWinMatch { winner = team }
        }
    }
}
