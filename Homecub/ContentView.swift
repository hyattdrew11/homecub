//
//  ContentView.swift
//  Homecub
//
//  Created by Drew Hyatt on 3/18/21.
//

import SwiftUI

//  remeber only 10 views aere allowed in top level view - do more research on this
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
       MainNavigation()
        
    }
}
struct MainNavigation: View {
    var body: some View {
        TabView {
                NavigationView {
                    Text("Search")
                    .navigationBarItems(leading:
                                        Button("Filter") {
                                            print("Filter Search!")
                                        }
                    )
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
                NavigationView {
                    Text("Updates")
                }
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Updates")
                }
            
                NavigationView {
                    Text("Viewings")
                }
                .tabItem {
                    Image(systemName: "house.circle.fill")
                    Text("Viewings")
                }
                NavigationView {
                    Text("Contacts")
                }
                .tabItem {
                    Image(systemName: "figure.wave")
                    Text("Contacts")
                }
                NavigationView {
                    Text("Menu")
                }
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Menu")
                }

        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color(hex: 0x14203e))
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
            }
        }
    }

    struct WeatherDayView: View {
        var dayOfWeek: String
        var imageName: String
        var temperature: Int
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
    struct BackgroundView: View {
        
        var topColor: Color
        var bottomColor: Color
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
    }
    
    struct CityTextView: View {
        var cityName: String
        var body: some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
    }
    
    struct MainWeatherStatusView: View {
        var imageName: String
        var temperature: Int
        var body: some View {
            VStack(spacing: 10){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("75").font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 40)
        }
    }
    
    struct WeatherButton: View {
        
        var title: String
        var textColor: Color
        var backgroundColor: Color
        
        var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }



//        ZStack {
            
//            BackgroundView(topColor: isNight ? .black : .blue,
//                           bottomColor: isNight ? .gray : Color("lightBlue"))
//
//            VStack {
//                CityTextView(cityName: "Jackson, MS")
//                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill",
//                                      temperature: 76)
//                HStack(spacing: 20) {
//                    WeatherDayView(dayOfWeek: "TUE",
//                               imageName: "cloud.sun.fill",
//                               temperature: 74)
//
//                    WeatherDayView(dayOfWeek: "WED",
//                                   imageName: "cloud.sun.fill",
//                                   temperature: 88)
//
//                    WeatherDayView(dayOfWeek: "THU",
//                               imageName: "cloud.sun.fill",
//                               temperature: 79)
//
//                    WeatherDayView(dayOfWeek: "FRI",
//                                   imageName: "cloud.sun.fill",
//                                   temperature: 71)
//
//                    WeatherDayView(dayOfWeek: "SAT",
//                                   imageName: "cloud.sun.fill",
//                                   temperature: 70)
//                }
//
//                Spacer()
//
//                Button {
//                    isNight.toggle()
//                    }
//                    label: {
//                        WeatherButton(title: "Change day time",
//                                  textColor: .blue,
//                                  backgroundColor: .white)
//                    }
//                }
                
//            }
