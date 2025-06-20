//
//   DietPlanView+SearchBar.swift
//  Assignment
//
//  Created by Basant Kumar on 20/06/25.
//

import SwiftUI

extension DietPlanView {
    var searchBarView: some View {
        HStack(spacing: 12) {
            HStack(spacing: 8) {
                Image("search_icon")
                    .resizable()
                    .frame(width: 16, height: 16)

                TextField("Search Meals", text: $searchText)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            Button(action: {
            }) {
                Image("filter_icon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(10)
            }
        }
    }
}
