//
//  MenuItemView.swift
//  HuliPizza
//
//  Created by Aditi Dalvi on 05/04/25.
//

import SwiftUI

struct MenuItemView: View {
    var body: some View {
        VStack {
            if let image = UIImage(named: "0_lg") {
                Image(uiImage: image)
                    .font(.largeTitle)
            } else {
                Image("surfboard_sm")
                    .font(.largeTitle)
            }
            Text("Menu Items")
        }
    }
}

#Preview {
    MenuItemView()
}
