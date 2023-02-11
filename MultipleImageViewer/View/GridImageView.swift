//
//  GridImageView.swift
//  MultipleImageViewer
//
//  Created by Abdullah Karaboğa on 11.02.2023.
//

import SwiftUI

struct GridImageView: View {

    @EnvironmentObject var homeData: HomeViewModel
    var index: Int

    var body: some View {

        ZStack {
            if index <= 3 {
                Image(homeData.allImages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: (getRect().width - 100) / 2, height: 120)
                    .cornerRadius(12)
            }
            if homeData.allImages.count > 4 && index == 3 {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.3))

                let remainingImages = homeData.allImages.count - 4

                Text("+\(remainingImages)")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
    }
}

struct GridImageView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {

    func getRect () -> CGRect {
        return UIScreen.main.bounds
    }
}
