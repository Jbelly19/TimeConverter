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
    
    @State private var inputTime = Date()
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    //                    TextField("Input Time", text: $inputTime)
                    DatePicker("Input time", selection: $inputTime, displayedComponents: .hourAndMinute)
                }
                Section(header: Text("Select Output Units:")){
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(0 ..< timeUnits.count){
                            Text("\(self.timeUnits[$0].unitName)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
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
