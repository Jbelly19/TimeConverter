//
//  ContentView.swift
//  UnitConverter
//
//  Created by Josh Belmont on 10/3/20.
//

import SwiftUI

struct ContentView: View {
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter
    }
    
    
    struct TimeUnits {
        var unitName: String
        var unit: UnitDuration
    }
    
    let timeUnits = [TimeUnits(unitName: "Seconds", unit: UnitDuration.seconds), TimeUnits(unitName: "Minutes", unit: UnitDuration.minutes), TimeUnits(unitName: "Hours", unit: UnitDuration.hours)]
    
//    @State private var inputSeconds = ""
    
    @State private var inputTime = Date();
    @State private var outputUnit = 0
    
    var totalTime: Double {
        let hours = inputTime.
    }
    
    var body: some View {
        NavigationView{
            Form{
                // Input in HH:MM:SS
                Section(header: Text("Input Time (HH:MM:SS): ")){
                    TextField("Input Time", value: $inputTime, formatter: timeFormat)
                }.textCase(nil)
                
                // Output Unit selection
                Section(header: Text("Output Unit:")){
                    Picker("Input Unit", selection: $outputUnit){
                        ForEach(0 ..< timeUnits.count){
                            Text("\(self.timeUnits[$0].unitName)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                // Output
                Section(header: Text("Total Time:")){
                    Text("test")
                }.textCase(nil)
            }
        }.navigationBarTitle("Time Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
