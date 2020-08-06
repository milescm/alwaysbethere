//
//  KakaoMapView.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/08/04.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct KakaoMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MTMapView {
        MTMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MTMapView, context: Context) {
        uiView.baseMapType = MTMapType.standard
        uiView.showCurrentLocationMarker = true
        uiView.currentLocationTrackingMode = .onWithoutHeading
        let currentMapPoint = MTMapPoint.init(geoCoord: MTMapPointGeo(latitude: 36.366862, longitude: 127.344279))
        uiView.setMapCenter(currentMapPoint!, zoomLevel: MTMapZoomLevel(4.0), animated: true)
        
    }
}

struct KakaoMapView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoMapView()
    }
}
