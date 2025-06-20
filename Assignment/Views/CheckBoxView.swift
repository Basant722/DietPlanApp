//
//  CheckBoxView.swift
//  Assignment
//
//  Created by Basant Kumar on 19/06/25.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(isChecked ? "icon_checkbox_selected" : "icon_checkbox")
                .resizable()
                .frame(width: 19, height: 19)
        }
    }
}
