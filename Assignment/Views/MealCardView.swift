//
//  MealCardView.swift
//  Assignment
//
//  Created by Basant Kumar on 19/06/25.
//
import SwiftUI

struct MealCardView: View {
    let recipe: Recipe
    var isMealSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .frame(width: 109, height: 114)
                        .cornerRadius(8)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 109, height: 114)
                        .cornerRadius(8)
                }
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(recipe.title)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                        
                        Image("icon_favorite")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 16, height: 16)
                            .opacity(recipe.isFavorite == 1 ? 1 : 0.3)
                    }
                    Spacer()
                    HStack(spacing: 4) {
                        Image("clock_icon")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("\(recipe.duration) mins")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    Image("line")
                        .resizable()
                        .frame(width: 211, height: 1)
                        .padding(.vertical, 4)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                        }) {
                            Image("customize_image")
                                .resizable()
                                .frame(width: 100, height: 28)
                        }
                        .buttonStyle(PlainButtonStyle())

                        
                        if !isMealSelected {
                            Button(action: {}) {
                                HStack(spacing: 4) {
                                    Image(recipe.isCompleted == 1 ? "fed_icom" : "not_fed_icom")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text(recipe.isCompleted == 1 ? "Fed" : "Fed?")
                                        .font(.caption)
                                }
                                .frame(width: 100, height: 28)
                                .background(Color.white)
                                .foregroundColor(recipe.isCompleted == 1 ? .gray : Color(UIColor(red: 0.298, green: 0.345, blue: 0.851, alpha: 1)))

                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .cornerRadius(14)
                            }
                        }
                    }
                }
            }
        }
        .padding(8)
        .background(Color(red: 0.96, green: 0.95, blue: 1.0))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isMealSelected ? Color.blue : Color.clear, lineWidth: 1)
        )
        .cornerRadius(12)
    }
}
