//
//  ScreenSize.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit

struct ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let topPadding =  UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
}
