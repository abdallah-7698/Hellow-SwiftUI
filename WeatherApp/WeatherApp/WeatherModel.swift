
import Foundation
import SwiftUI

struct WeatherModel {
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
    
    init(isNight: Binding<Bool>, dayOfWeek: WeatherModel.DaysOfTheWeak, imageName: TimeBasedValue<WeatherModel.WeatherImages>, temperature: Int) {
        self.dayOfWeek = dayOfWeek.rawValue
        self.imageName = isNight.wrappedValue ? imageName.nightValue.rawValue : imageName.morningValue.rawValue
        self.temperature = temperature
    }
}

extension WeatherModel: Identifiable {
    var id: UUID { return UUID() }
}

struct TimeBasedValue<T> {
    
    let morningValue: T
    let nightValue: T
    
    init(_ morningValue: T, nightValue: T? = nil) {
        self.morningValue = morningValue
        self.nightValue = nightValue ?? morningValue
    }
}

extension WeatherModel {
    enum DaysOfTheWeak: String{
        case sat    = "SAT"
        case sun    = "SUN"
        case mon    = "MON"
        case tue    = "TUE"
        case wed    = "WED"
        case thu    = "THU"
        case fri    = "FRI"
    }
    
    enum WeatherImages: String {
        case sunMaxFill         = "sun.max.fill"
        case sunriseFill        = "sunrise.fill"
        case sunsetFill         = "sunset.fill"
        case moonFill           = "moon.fill"
        case moonStarsFill      = "moon.stars.fill"
        case cloudFill          = "cloud.fill"
        case cloudSunFill       = "cloud.sun.fill"
        case cloudRainFill      = "cloud.rain.fill"
        case windSnow           = "wind.snow"
        case snowflake          = "snowflake"
        case tornado            = "tornado"
    }
}
