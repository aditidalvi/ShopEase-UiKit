//
//  MenuRowView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI
struct MenuRowView: View {
    let item: Int
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if let image = UIImage(named: "\(item)_sm") {
                Image(uiImage: image)
                    .font(.largeTitle)
            } else {
                Image("surfboard_sm")
                    .font(.largeTitle)
            }
            VStack(alignment: .leading) {
                Text("Margherita Pizza")
                RatingsView(ratingValue: item)            }
        }
    }
}

#Preview {
    MenuRowView(item: 4)
}
