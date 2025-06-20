//
//  StringConstant.swift
//  Assignment
//
//  Created by Basant Kumar on 19/06/25.
//


import SwiftUI

struct TextStyles {
    // Title: "Everyday Diet Plan"
    static func headerTitle(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Bold", size: 20))
               .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
               .kerning(-0.4)
       }
    
    // Subtitle: "Track Ananya’s every meal"
    static func subHeader(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Medium", size: 14))
               .foregroundColor(Color(red: 0.443, green: 0.443, blue: 0.443))
               .kerning(-0.28)
       }
    // Section Header: "Diet Streak"
    static func sectionHeader(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Bold", size: 18))
               .foregroundColor(Color(red: 0.067, green: 0.067, blue: 0.067))
               .kerning(-0.36)
       }
    
    
    // Morning, after noon ........
    static func dietTitle(_ title: String) -> some View {
        Text(title)
            .font(.custom("DMSans-Medium", size: 12))
            .kerning(-0.24)
            .foregroundColor(Color(red: 0.067, green: 0.067, blue: 0.067))
    }
    
    static func selectAll(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Bold", size: 14))
               .foregroundColor(Color(red: 0.067, green: 0.067, blue: 0.067))
               .kerning(-0.28)
       }
    
    static func streakText(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Medium", size: 14))
               .foregroundColor(Color(red: 0.443, green: 0.443, blue: 0.443))
               .kerning(-0.28)
       }
    
    static func groceryLabel(_ text: String) -> some View {
           Text(text)
               .font(.custom("DMSans-Medium", size: 12))
               .foregroundColor(Color(red: 0.067, green: 0.067, blue: 0.067))
               .kerning(-0.24)
       }
    
    
    static func mealTime(_ text: String) -> some View {
        Text(text)
            .font(.custom("DMSans-Bold", size: 16))
            .foregroundColor(Color(red: 0.443, green: 0.443, blue: 0.443))
            .kerning(-0.32)
            .lineSpacing(4) 
    }
    
}
