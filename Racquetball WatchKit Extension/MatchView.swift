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
                VStack {
                    Text("Myself")
                        .fontWeight(match.winner == Team.one ? .bold : .regular)
                        .font(.footnote)
                    Image(systemName: "circle.fill")
                        .foregroundColor(match.server == Team.one ? .blue : .clear)
                    Button(action: {
                        self.match.winRally(for: Team.one)
                    }) {
                        Image(systemName: "\(match.teamGameScores[0]).square")
                        .font(.largeTitle)
                    }
                }
                
                VStack {
                    Text("Opponent")
                        .fontWeight(match.winner == Team.two ? .semibold : .regular)
                        .font(.footnote)
                    Image(systemName: "circle.fill")
                        .foregroundColor(match.server == Team.two ? .blue : .clear)
                    Button(action: {
                        self.match.winRally(for: Team.two)
                    }) {
                        Image(systemName: "\(match.teamGameScores[1]).square")
                        .font(.largeTitle)
                    }
                }
            }
            .disabled(match.winner != nil ? true : false)
            
            VStack {
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
                .navigationBarBackButtonHidden(true)
            }
            .contextMenu {
                Button(action: {
                    self.match = Match()
                }, label: {
                    VStack{
                        Image(systemName: "plus")
                            .font(.title)
                        Text("New Match")
                    }
                })
            }
        }
        .navigationBarTitle(match.winner != nil ? "Winner" : "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchView()
            .previewDevice("Apple Watch Series 5 - 44mm")
            MatchView()
            .previewDevice("Apple Watch Series 5 - 40mm")
            MatchView()
            .previewDevice("Apple Watch Series 3 - 42mm")
            MatchView()
            .previewDevice("Apple Watch Series 3 - 38mm")
        }
    }
}
