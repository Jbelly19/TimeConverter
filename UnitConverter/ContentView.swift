//
//  ContentView.swift
//  UnitConverter
//
//  Created by Josh Belmont on 10/3/20.
//

import SwiftUI

struct ContentView: View {
    struct TimeUnits {
        var unitName: String
        var unit: UnitDuration
    }
    
    let timeUnits = [TimeUnits(unitName: "Seconds", unit: UnitDuration.seconds), TimeUnits(unitName: "Minutes", unit: UnitDuration.minutes), TimeUnits(unitName: "Hours", unit: UnitDuration.hours)]
    
    @State private var inputTime = "0.0.0"
    @State private var outputUnit = 0
    
    var totalTimeSec: Measurement<UnitDuration> {
        let inputTimeArray = inputTime.components(separatedBy: ".")
        if inputTimeArray.count < 3 {
            return Measurement(value: 0, unit: UnitDuration.seconds)
        }
        
        let hours = Measurement(value: Double(inputTimeArray[0]) ?? 0, unit: UnitDuration.hours)
        let minutes = Measurement(value: Double(inputTimeArray[1]) ?? 0, unit: UnitDuration.minutes)
        let seconds = Measurement(value: Double(inputTimeArray[2]) ?? 0, unit: UnitDuration.seconds)
        
        return hours.converted(to: UnitDuration.seconds) + minutes.converted(to: UnitDuration.seconds) + seconds
    }
    
    var body: some View {
        NavigationView{
            Form{
                // Input in HH.MM.SS
                Section(header: Text("Input Time (HH.MM.SS): ")){
                    TextField("Input Time", text: $inputTime)
                        .keyboardType(.decimalPad)
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
                    Text("\(totalTimeSec.converted(to: timeUnits[outputUnit].unit).description)")
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
