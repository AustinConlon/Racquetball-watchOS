//
//  ContentView.swift
//  Racquetball WatchKit Extension
//
//  Created by Austin Conlon on 12/18/19.
//  Copyright © 2019 Austin Conlon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var match = Match()
    
    var body: some View {
        VStack {
            Text("Points")
            
            HStack() {
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
                
            Text("Points")
            
            HStack() {
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
            .navigationBarTitle(match.server == Team.one ? "You Serve" : "You Receive")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            .previewDevice("Apple Watch Series 5 - 44mm")
            ContentView()
            .previewDevice("Apple Watch Series 5 - 40mm")
            ContentView()
            .previewDevice("Apple Watch Series 3 - 42mm")
            ContentView()
            .previewDevice("Apple Watch Series 3 - 38mm")
        }
    }
}
