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

    @Published var showImageViewer = false
    @Published var selectedImageID: String = ""
    @Published var imageViewerOffset: CGSize = .zero

    @Published var bgOpacity: Double = 1

    func onChange(value: CGSize) {

        imageViewerOffset = value

        let halfHeight = UIScreen.main.bounds.height / 2

        let progress = imageViewerOffset.height / halfHeight

        withAnimation(.default) {
            bgOpacity = Double(1 - progress < 0 ? -progress : progress)
        }

    }

    func onEnded(value: DragGesture.Value) {

        withAnimation(.easeInOut) {
            var translation = value.translation.height

            if translation < 0 {
                translation = -translation
            }

            if translation < 250 {
                imageViewerOffset = .zero
                bgOpacity = 1

            } else {

                showImageViewer.toggle()
                imageViewerOffset = .zero
                bgOpacity = 1

            }



        }

    }
}
