//
//  RatingsView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI

struct RatingsView: View {
    let ratingValue: Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { value in
                if value <= ratingValue {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.title)
                } else {
                    Image(systemName: "circle")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    RatingsView(ratingValue: 4)
}
