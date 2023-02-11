//
//  HomeViewModel.swift
//  MultipleImageViewer
//
//  Created by Abdullah Karaboğa on 10.02.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var allImages: [String] = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
    ]
}
