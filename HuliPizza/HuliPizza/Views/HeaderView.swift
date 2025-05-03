//
//  HeaderView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("surfBanner")
                .resizable()
                .scaledToFit()
            Text("Huli Pizza Company")
                .font(.headline)
                .padding()
                .background(Color.white)
        }
    }
}

#Preview {
    HeaderView()
}
