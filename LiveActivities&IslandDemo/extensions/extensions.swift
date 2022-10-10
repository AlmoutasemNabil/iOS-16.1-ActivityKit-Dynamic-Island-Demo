//
//  extensions.swift
//  LiveActivities&IslandDemo
//
//  Created by AlmoutasemBellah Abdallah on 10/10/2022.
//

import SwiftUI

extension Button {
    public func setButtonLook() -> some View{
        self
            .padding()
            .background(Color.blue.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}
