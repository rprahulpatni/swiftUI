//
//  SearchViewDetails.swift
//  SwiftUIDemo
//
//  Created by Neosoft on 02/08/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct SearchViewDetails: View {
    var videoData: VideoModel?
    @State private var isLandscapeActive = false
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
//                Text("Device Orientation: \(isLandscapeActive ? "Landscape" : "Portrait")")

                ZStack(alignment: .topTrailing) {
                    if isLandscapeActive {
                        // Landscape view (fullscreen video player)
                        LandscapeView(isLandscapeActive: $isLandscapeActive, urlString: videoData!.sources)
                    } else {
                        CustomVideoPlayerView(videoURL: URL(string: videoData!.sources)!)
                            .frame(height: 250)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    Button(action: {
                        withAnimation {
                            isLandscapeActive.toggle()
                        }
                    }) {
                        Image(systemName: isLandscapeActive ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                            .font(.title)
                            .padding()
                    }
                }
                VStack(alignment: .leading, spacing: 10){
                    Text(videoData?.title ?? "")
                        .font(.headline)
                    Text(videoData?.description ?? "")
                        .font(.caption)
                }
                .padding(.all, 15)
            }.toolbar(.hidden, for: .tabBar)
                .navigationBarTitle("VIDEO DETAILS", displayMode: .inline)
                .navigationBarBackButtonHidden()
                .navigationBarItems(leading: CustomBackButton())
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                        determineOrientation()
                    }
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(UIDevice.orientationDidChangeNotification)
                }
        }
    }
    
    private func determineOrientation() {
        let screenSize = UIScreen.main.bounds.size
        isLandscapeActive = screenSize.width > screenSize.height
    }
    
    private func rotateDeviceOrientation() {
        if isLandscapeActive {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
        } else {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}

struct LandscapeView: View {
    @Binding var isLandscapeActive: Bool
    var urlString : String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CustomVideoPlayerView(videoURL: URL(string: urlString)!)
                .aspectRatio(16/9, contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Done") {
            withAnimation {
                isLandscapeActive = false
            }
        })
    }
}

