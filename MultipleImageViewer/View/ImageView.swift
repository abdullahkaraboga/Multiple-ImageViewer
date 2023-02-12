//
//  ImageView.swift
//  MultipleImageViewer
//
//  Created by Abdullah Karaboğa on 12.02.2023.
//

import SwiftUI

struct ImageView: View {

    @EnvironmentObject var homeData: HomeViewModel
    @GestureState var draggingOffset: CGSize = .zero

    var body: some View {
        ZStack {


            ScrollView(.init()) {
                TabView(selection: $homeData.selectedImageID) {
                    ForEach (homeData.allImages, id: \.self) { image in

                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(image)
                            .offset(y: homeData.imageViewerOffset.height)
                    }
                }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .overlay(

                    Button(action: {
                        withAnimation(.default) {
                            homeData.showImageViewer.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.35))
                            .clipShape(Circle())
                    })
                        .padding(10)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .opacity(homeData.bgOpacity)
                    , alignment: .topTrailing
                )
            }
                .ignoresSafeArea()

        }
            .gesture(DragGesture().updating($draggingOffset, body: { (value, outValue, _) in
            outValue = value.translation
            homeData.onChange(value: draggingOffset)
        }).onEnded(homeData.onEnded(value:)))
            .transition(.move(edge: .bottom))
    }
}


struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
