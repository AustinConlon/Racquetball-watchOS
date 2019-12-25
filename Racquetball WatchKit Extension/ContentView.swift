//
//  MatchView.swift
//  Racquetball WatchKit Extension
//
//  Created by Austin Conlon on 12/18/19.
//  Copyright © 2019 Austin Conlon. All rights reserved.
//

import SwiftUI

struct MatchView: View {
    @State var match = Match()
    
    var body: some View {
        VStack {
            HStack {
                Text("Yourself")
                    .foregroundColor(match.server == Team.one ? .blue : .primary)
                Text("Opponent")
                    .foregroundColor(match.server == Team.two ? .blue : .primary)
            }

            Divider()
            
            HStack {
                Group {
                    Button(action: {
                        self.match.winRally(for: Team.one)
                    }) {
                        Image(systemName: "\(match.teamGameScores[0]).square")
                        .font(.largeTitle)
                    }
                }
                
                Group {
                    Button(action: {
                        self.match.winRally(for: Team.two)
                    }) {
                        Image(systemName: "\(match.teamGameScores[1]).square")
                        .font(.largeTitle)
                    }
                }
            }
                
            Text("Games")
            
            HStack {
                Group {
                    Image(systemName: "\(match.teamMatchScores[0]).square")
                    .font(.largeTitle)
                }
                .padding(.horizontal)
                
                Group {
                    Image(systemName: "\(match.teamMatchScores[1]).square")
                    .font(.largeTitle)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle(match.server == Team.one ? "You Serve" : "You Return")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchView()
            .previewDevice("Apple Watch Series 5 - 44mm")
//            MatchView()
//            .previewDevice("Apple Watch Series 5 - 40mm")
//            ContentView()
//            .previewDevice("Apple Watch Series 3 - 42mm")
//            ContentView()
//            .previewDevice("Apple Watch Series 3 - 38mm")
        }
    }
}
