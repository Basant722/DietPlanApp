//
//  DietPlanView+DietStreak.swift
//  Assignment
//
//  Created by Basant Kumar on 20/06/25.
//

import SwiftUI

extension DietPlanView {
    var dietStreakView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                TextStyles.sectionHeader("Diet Streak")
                Spacer()
                HStack(spacing: 4) {
                    Image("streak_icon")
                        .resizable()
                        .frame(width: 15, height: 16)
                    
                    TextStyles.streakText("\(viewModel.diets.dietStreak.filter { $0 == "COMPLETED" }.count) Streak")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(UIColor(red: 0.298, green: 0.345, blue: 0.851, alpha: 1)), lineWidth: 1)
                )

            }
            HStack(spacing: 56) {
                let items = [("Morning", "streak_morning_icon", ""), ("Afternoon", "streak_afternoon_icon", ""), ("Evening", "streak_evening_icon", "streak_evening_icon1"), ("Night", "streak_night_icon", "streak_night_icon1")]
                
                ForEach(0..<items.count, id: \.self) { i in
                    VStack(spacing: 6) {
                        TextStyles.dietTitle(items[i].0)
                        ZStack {
                            Image(items[i].1)
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            if !items[i].2.isEmpty {
                                Image(items[i].2)
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 0.965, green: 0.984, blue: 0.914))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0.898, green: 0.961, blue: 0.741), lineWidth: 1)
                )
        )
    }
}
