//
//  Home.swift
//  MultipleImageViewer
//
//  Created by Abdullah Karaboğa on 10.02.2023.
//

import SwiftUI

struct Home: View {

    @StateObject var homeData = HomeViewModel()

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {

        ScrollView {
            HStack(alignment: .top, spacing: 15, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 60)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4,
                       content: {
                           (
                                Text("Abdullah Karaboğa")
                                    .fontWeight(.semibold)
                           )
                           Text("@abdllahkaraboa")
                               .foregroundColor(.gray)
                           Text("iOS Developer")
                               .foregroundColor(.blue)

                           let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

                           LazyVGrid(columns: columns, alignment: .leading, spacing: 10, content: {
                                         ForEach(homeData.allImages.indices, id: \.self) { index in

                                             GridImageView(index: index)
                                         }
                                     })

                               .padding(.top)

                       })
            }).padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }.overlay(

            ZStack {
                if homeData.showImageViewer {
                    
                    
                    Color.black
                        .opacity(homeData.bgOpacity)
                        .ignoresSafeArea()
                    
                    
                    ImageView()
                }
            }

        )
            .environmentObject(homeData)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
