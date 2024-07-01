//
//  PostData.swift
//  Hacker News
//
//  Created by Anup Saud on 2024-07-01.
//

import Foundation
import SwiftUI

struct Results: Decodable{
    let hits: [Post]
}
struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
