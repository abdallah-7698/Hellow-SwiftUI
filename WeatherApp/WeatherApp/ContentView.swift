//
//  ContentView.swift
//  WeatherApp
//
//  Created by Abdallah on 22/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false {
        didSet {
            weatherModels = DemoWeatherData(isNight: $isNight).weadtherModel
            selectedWeatherModel = self.weatherModels.first
        }
    }
    @State private var weatherModels: [WeatherModel] = []
    @State private var selectedWeatherModel: WeatherModel? = nil
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA", fontSize: 32)
                
                if selectedWeatherModel != nil {
                    MainWeatherStatusView(model: selectedWeatherModel!)
                }
                
                HStackOfWeatherDayViews(weatherModel: weatherModels, action: {selectedWeatherModel = $0})
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
                
            }
            .onAppear { isNight = false }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HStackOfWeatherDayViews: View {
    
    var weatherModel: [WeatherModel]
    var action: (WeatherModel) -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(weatherModel) { model in
                SmallWeatherDayView(model: model, action: action)
            }
        }
    }
}

struct SmallWeatherDayView: View {
    
    let model: WeatherModel
    var action: (WeatherModel) -> Void
    
    var body: some View {
        Button {
            action(model)
        } label: {
            VStack {
                Text(model.dayOfWeek)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                Image(systemName: model.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(model.temperature)°")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
            }
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray :  Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var fontSize: CGFloat
    
    var body: some View {
        Text(cityName)
            .font(.system(size: fontSize, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    let model: WeatherModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: model.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(model.temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

extension Text {
    func applyDefaultStyle(fontSize:  CGFloat) -> some View {
        self
            .font(.system(size: fontSize, weight: .medium))
            .foregroundColor(.white)
    }
}

struct DemoWeatherData {
    var weadtherModel: [WeatherModel]
    init(isNight: Binding<Bool>) {
        weadtherModel = [
            .init(isNight: isNight,
                  dayOfWeek: .thu,
                  imageName: .init(.cloudSunFill, nightValue: .moonStarsFill),
                  temperature: 76),
            .init(isNight: isNight,
                  dayOfWeek: .wed,
                  imageName: .init(.sunMaxFill, nightValue: .moonFill),
                  temperature: 88),
            .init(isNight: isNight,
                  dayOfWeek: .thu,
                  imageName: .init(.windSnow),
                  temperature: 55),
            .init(isNight: isNight,
                  dayOfWeek: .fri,
                  imageName: .init(.sunsetFill, nightValue: .windSnow),
                  temperature: 60),
            .init(isNight: isNight,
                  dayOfWeek: .sat,
                  imageName: .init(.snowflake),
                  temperature: 25)
        ]
    }
}
