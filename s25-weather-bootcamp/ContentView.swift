//import SwiftUIimport SwiftUI


import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                topScreen(time: "1:21")
                dayView(Location: "Chapel Hill", DayTemp: "55", DayType: "Sunny", High: "57", Low: "39", Wind: "5 mph", Humidity: "45%")
                hourlyForecastView()
                    .padding(5)
                tenDayForecastView()
                Spacer()
            }
        }
    }
}

struct topScreen: View {
    var time: String

    var body: some View {
        HStack {
            Text(time)
                .foregroundColor(.white)
                .font(.system(size: 20))
            Spacer()
            Image(systemName: "wifi")
                .foregroundColor(.white)
                .font(.system(size: 20))
            Image(systemName: "battery.75")
                .foregroundColor(.white)
                .font(.system(size: 20))
        }
        .padding(.horizontal)
    }
}

struct dayView: View {
    var Location: String
    var DayTemp: String
    var DayType: String
    var High: String
    var Low: String
    var Wind: String
    var Humidity: String

    var body: some View {
        VStack {
            Text(Location)
                .foregroundColor(.white)
                .font(.system(size: 32))
                .padding(1)
            Text("\(DayTemp)°")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .padding(1)
            Text(DayType)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .opacity(0.8)
            HStack {
                Text("H: \(High)°")
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                Text("L: \(Low)°")
                    .foregroundColor(.white)
                    .font(.system(size: 22))
            }
            HStack {
                Text("Wind: \(Wind)")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Text("Humidity: \(Humidity)")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
        }
    }
}

struct hourlyForecastView: View {
    let hours: [String] = ["Now", "2PM", "3PM", "4PM", "5PM", "6PM"]
    let icons: [String] = ["sun.max", "sun.max", "sun.max", "sun.max", "cloud.sun", "cloud.sun"]
    let temps: [String] = ["55°", "56°", "57°", "55°", "54°", "52°"]
    let precipitation: [String] = ["0%", "0%", "0%", "10%", "20%", "30%"]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text("Hourly Forecast")
                            .foregroundColor(.white)
                    }
                    .padding(6)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(spacing: 12) {
                        ForEach(0..<hours.count, id: \.self) { index in
                            VStack(spacing: 8) {
                                Text(hours[index])
                                    .foregroundColor(.white)
                                    .font(.subheadline)

                                Image(systemName: icons[index])
                                    .font(.title2)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(icons[index].contains("cloud") ? .white : .yellow, .white)

                                Text(temps[index])
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                
                                Text(precipitation[index])
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                            }
                            .frame(width: 60)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue.opacity(0.5))
        )
        .padding()
    }
}

struct tenDayForecastView: View {
    let days = ["Today", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue"]
    let icons = ["sun.max", "cloud.sun", "cloud.rain", "cloud.snow", "cloud.sun.fill", "sun.haze", "cloud", "sunset", "cloud.fog", "wind"]
    let highTemps = ["57", "60", "62", "58", "55", "53", "52", "50", "49", "47"]
    let lowTemps = ["39", "42", "44", "40", "38", "36", "35", "34", "33", "32"]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text("10-DAY FORECAST")
                            .foregroundColor(.white)
                    }
                    ForEach(0..<days.count, id: \.self) { index in
                        HStack(spacing: 20) {
                            Text(days[index])
                                .foregroundColor(.white)
                                .bold()

                            Image(systemName: icons[index])
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(icons[index].contains("cloud") ? .white : .yellow, .white)

                        
                            Spacer()

                            Text("H: \(highTemps[index])° L: \(lowTemps[index])°")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue.opacity(0.5))
        )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
