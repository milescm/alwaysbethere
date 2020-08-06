//
//  ContentView.swift
//  AlwaysBeThere
//
//  Created by cse on 2020/08/03.
//  Copyright © 2020 cse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingAdditionalActions = false
    @State var showingBookmark = false
    @State var showingSearchBar = false
    @State var moveToCurrentLocation = false
    @State var refresh = false
    
    let buttonSize: CGFloat = 30.0
    
    var additionalActionsButton: some View {
        Button(action: { self.showingAdditionalActions.toggle() }) {
            Image(systemName: "list.bullet")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("Additional actions"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var bookMarkButton: some View {
        Button(action: { self.showingBookmark.toggle() }) {
            Image(systemName: "bookmark")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("Reservation & Bookmarks"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var searchButton: some View {
        Button(action: { self.showingSearchBar.toggle() }) {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("additional actions"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var moveToCurrentLocationButton: some View {
        Button(action: { self.moveToCurrentLocation.toggle() }) {
            Image(systemName: "mappin.and.ellipse")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("Move the window to the current location"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var refreshButton: some View {
        Button(action: { self.refresh.toggle() }) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
                .frame(width: self.buttonSize, height: self.buttonSize, alignment: .center)
                .accessibility(label: Text("Refresh"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                KakaoMapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .topLeading)
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
            )
            .navigationBarItems(
                leading: HStack {
                    additionalActionsButton
                    Spacer()
                    bookMarkButton
                    Spacer()
                    searchButton
                    Spacer()
                    moveToCurrentLocationButton
                    Spacer()
                    refreshButton
                }.padding())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
