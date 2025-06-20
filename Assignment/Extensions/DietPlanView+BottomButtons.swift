//
//  DietPlanView+BottomButtons.swift
//  Assignment
//
//  Created by Basant Kumar on 20/06/25.
//

import SwiftUI
extension DietPlanView {
    var bottomButtons: some View {
        HStack(spacing: 16) {
            Button("Fed?") {
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(25)

            Button("Cancel") {}
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(25)
        }
        .padding(.top)
    }

    
    
    
    
}
