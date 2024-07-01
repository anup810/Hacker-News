//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Anup Saud on 2024-07-01.
//

import Foundation

class NetworkManager: ObservableObject{
    @Published  var posts = [Post]()
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let jsonDecoder = JSONDecoder()
                    if let safedata = data{
                        do{
                          let results = try jsonDecoder.decode(Results.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        }catch{
                            print(error.localizedDescription)
                        }
                        
                    }
                   
                }
            }
            task.resume()
            
        }

    }
}
