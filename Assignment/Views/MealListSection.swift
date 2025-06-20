//
//  MealListSection.swift
//  Assignment
//
//  Created by Basant Kumar on 19/06/25.

import SwiftUI

struct MealListSection: View {
    let section: MealSection
    let sectionIndex: Int
    @Binding var selectedRecipeIDs: Set<Int>
    var onSelectAllChanged: (Bool) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading) {
                    Text(section.daytime)
                        .font(.headline)
                    Text(section.timings)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 6)
                        .frame(width: 56, height: 56)

                    Circle()
                        .trim(from: 0, to: progressRatio)
                        .stroke(
                            Color(red: 1, green: 0.45, blue: 0.5),
                            style: StrokeStyle(lineWidth: 6, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(width: 56, height: 56)

                    VStack(spacing: 2) {
                        Text("Status")
                            .font(.caption2)
                        TextStyles.streakText("\(section.progressStatus.completed) of \(section.progressStatus.total)")
                           
                    }
                }
            }
            HStack {
                CheckBoxView(isChecked: Binding(
                    get: {
                        section.recipes.allSatisfy { selectedRecipeIDs.contains($0.id) }
                    },
                    set: { onSelectAllChanged($0) }
                ))
                TextStyles.selectAll("Select All")
            }

            // MARK: - Meals List
            ForEach(section.recipes) { recipe in
                let isSelected = selectedRecipeIDs.contains(recipe.id)
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        if isSelected {
                            CheckBoxView(isChecked: Binding(
                                get: { selectedRecipeIDs.contains(recipe.id) },
                                set: { isChecked in
                                    if isChecked {
                                        selectedRecipeIDs.insert(recipe.id)
                                    } else {
                                        selectedRecipeIDs.remove(recipe.id)
                                    }
                                }
                            ))
                        }

                        TextStyles.mealTime(formatTime(recipe.timeSlot))
                    }

                    MealCardView(
                        recipe: recipe,
                        isMealSelected: isSelected
                    )
                }
            }
        }
    }
    private func formatTime(_ value: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        if let date = formatter.date(from: value) {
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: date)
        }
        return value
    }

    private var progressRatio: CGFloat {
        let total = max(section.progressStatus.total, 1)
        return CGFloat(section.progressStatus.completed) / CGFloat(total)
    }
}
