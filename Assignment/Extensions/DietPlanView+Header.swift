//
//  DietPlanView+Header.swift
//  Assignment
//
//  Created by Basant Kumar on 20/06/25.
//

import SwiftUI
extension DietPlanView {
    var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button(action: {}) {
                    Image("back_button_arrow")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    TextStyles.headerTitle("Everyday Diet Plan")
                    TextStyles.subHeader("Track Ananya’s every meal")
                }
                
                Spacer()
                
                VStack(spacing: 4) {
                    Button(action: {}) {
                        Image("cart_icon")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding(8)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .shadow(radius: 1)
                    }
                    TextStyles.groceryLabel("Grocery List")
                }
            }
        }
    }
    
}
