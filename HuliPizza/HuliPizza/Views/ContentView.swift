//
//  ContentView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    var orders: [Int] = [1,2,3]
    var body: some View {
        VStack {
            HeaderView()
            OrderView(orders: orders)
            MenuView()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
