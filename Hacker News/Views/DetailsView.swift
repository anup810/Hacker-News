//
//  DetailsView.swift
//  Hacker News
//
//  Created by Anup Saud on 2024-07-01.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailsView(url: "https://www.google.com")
}

