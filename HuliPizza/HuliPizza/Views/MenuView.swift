//
//  MenuView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        MenuItemView()
        ScrollView {
            ForEach(0...9, id: \.self) { item in
                MenuRowView(item: item)
            }
        }
    }
}

#Preview {
    MenuView()
}
