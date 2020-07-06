//
//  ContentView.swift
//  DemoApp
//
//  Created by Martin Václavík on 25/09/2019.
//  Copyright © 2019 Martin Václavík. All rights reserved.
//

import SwiftUI

struct NationDetail: View {
    @State var showInfo:Bool = false
    @EnvironmentObject var settings: GlobalSettings
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var dueDate = Date()
    var nation: Nation
    @State var showLegend:Bool = false
    
    @State private var selection = "default"
    var body: some View {
        TabView(selection: $selection){
            ZStack {
                NationDetailInfo(nation: nation, legend: $showLegend)
                    .opacity(showLegend ? 0.3 : 1)
                if (showLegend){
                    VStack{
                        Spacer()
                        RecognitionLegend()
                            .background(Color(UIColor.systemBackground))
                            .shadow(radius: 10)
                            .gesture(DragGesture(minimumDistance: 1, coordinateSpace: .local)
                                .onEnded { value in
                                    if (value.translation.height > 20) { self.showLegend = false}
                                })
                    }.animation(.easeInOut)
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                }
            }.onTapGesture {
                    withAnimation(){
                        self.showLegend = false
                    }
            }
            .tag("default")
            .tabItem{
                VStack {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
                }
            }
            ZStack {
                MapView(coord: nation.locationCoordinate, zoom: nation.locationZoom)
            }
            .tag("map")
            .tabItem{
                VStack {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            }
        }
        .navigationBarTitle(LocalizedStringKey(nation.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                self.showInfo.toggle()
            }
            ) {
                Image(systemName: "questionmark.circle")
                    .padding()
            }
        )
            .alert(isPresented: $showInfo) {
                Alert(title: Text("infoLastUpdate"), message: Text("\(dueDate,formatter: NationDetail.self.taskDateFormat)"),
                      dismissButton: .default(Text("Back")) {})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                NationDetail(nation: restNation[153])
            }
        }
    }
}

struct NationDetailInfo: View {
    @State var nation: Nation
    @Binding var legend:Bool
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack{
                    NationDetailFlag(nation: $nation).padding()
                    Text(LocalizedStringKey(nation.name))
                        .font(.title).multilineTextAlignment(.center)
                }
            }
            Divider()
            HStack{
                Text("MainCity")
                    .padding(.leading)
                Spacer()
                Text(LocalizedStringKey(nation.capital))
                    .padding(.trailing)
            }
            Divider()
            HStack{
                Text("Population")
                    .padding(.leading)
                Spacer()
                Text("\(nation.population)")
                    .padding(.trailing)
            }
            Group{
                Divider()
                HStack{
                    Text("StateSize")
                        .padding(.leading)
                    Spacer()
                    Text("\(nation.area.removeZerosFromEnd()) km²")
                        .padding(.trailing)
                }
                Divider()
                HStack{
                    Text("Density")
                        .padding(.leading)
                    Spacer()
                    Text("\(nation.density)/km²")
                        .padding(.trailing)
                }
                Divider()
                if (nation.recognition != "All"){
                    HStack{
                        if (nation.recognition == "Red" || nation.recognition == "Orange"){
                            RoundedRectangle(cornerRadius: 3)
                                .fill(nation.recognition == "Red" ? Color("RedRecognition") : Color("OrangeRecognition"))
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                                .onTapGesture {
                                    withAnimation(){
                                        self.legend.toggle()
                                    }
                            }
                            Spacer()
                            Text(nation.recognition == "Red" ? "RedRecognition" : "OrangeRecognition")
                                .padding(.horizontal).multilineTextAlignment(.trailing)
                        }else if (nation.recognition == "Pink" || nation.recognition == "Green"){
                            RoundedRectangle(cornerRadius: 3)
                                .fill(nation.recognition == "Pink" ? Color("PinkRecognition") : Color("GreenRecognition"))
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                                .onTapGesture {
                                    withAnimation(){
                                        self.legend.toggle()
                                    }
                            }
                            Spacer()
                            Text(nation.recognition == "Pink" ? "PinkRecognition" : "GreenRecognition")
                                .padding(.horizontal).multilineTextAlignment(.trailing)
                        }
                    }
                    Divider()
                }
            }
        }.padding()
    }
}

struct RecognitionLegend: View {
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color("RedRecognition"))
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Text("RedRecognition")
                    .padding(.horizontal)
            }
            Divider()
            HStack{
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color("OrangeRecognition"))
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Text("OrangeRecognition")
                    .padding(.horizontal)
            }
            Divider()
            HStack{
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color("GreenRecognition"))
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Text("GreenRecognition")
                    .padding(.horizontal)
            }
            Divider()
            HStack{
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color("PinkRecognition"))
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Text("PinkRecognition")
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}
