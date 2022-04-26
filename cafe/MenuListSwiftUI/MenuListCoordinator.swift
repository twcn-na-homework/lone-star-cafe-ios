//
//  MenuListCoordinator.swift
//  Cafe
//
//  Created by Lecheng Yang on 2022/3/17.
//

import SwiftUI

struct MenuListCoordinator: View {
    var body: some View {
        NavigationView {
            VStack {
                MenuListView(viewModel: MenuListSwiftUIViewModel(service: MenuService()))
                .navigationBarTitle("Lone Star Cafe", displayMode: .inline)
            }.edgesIgnoringSafeArea(.top)
        }
    }
}
