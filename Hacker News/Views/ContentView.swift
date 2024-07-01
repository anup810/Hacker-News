//
//  ContentView.swift
//  Hacker News
//
//  Created by Anup Saud on 2024-07-01.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationStack{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailsView(url: post.url)){
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }

            .navigationTitle("Hacker News")

        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })

    }
}

#Preview {
    ContentView()
}


