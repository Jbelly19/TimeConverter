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
    
    @State private var outputUnit = 0
    
    @State private var inputHours = 0
    @State private var inputMinutes = 0
    @State private var inputSectonds = 0
    
    let MAX_INPUT_HOURS = 25
    let MAX_INPUT_MIN_SEC = 60
    
    var totalTimeSec: Measurement<UnitDuration> {
        
        let hours = Measurement(value: Double(inputHours) , unit: UnitDuration.hours)
        let minutes = Measurement(value: Double(inputMinutes) , unit: UnitDuration.minutes)
        let seconds = Measurement(value: Double(inputSectonds) , unit: UnitDuration.seconds)
        
        return hours.converted(to: UnitDuration.seconds) + minutes.converted(to: UnitDuration.seconds) + seconds
    }
    
    var body: some View {
        NavigationView{
            Form{
                // Input in HH.MM.SS
                Section(header: Text("Input Time (HH.MM.SS): ")){
                    GeometryReader { geometry in
                        HStack(spacing: 4){
                            
                            Picker("", selection: $inputHours){
                                ForEach(0 ..< MAX_INPUT_HOURS){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .labelsHidden()
                            .fixedSize(horizontal: true, vertical: true)
                            .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                            .clipped()
                            
                            Picker("", selection: $inputMinutes){
                                ForEach(0 ..< MAX_INPUT_MIN_SEC){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .labelsHidden()
                            .fixedSize(horizontal: true, vertical: true)
                            .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                            .clipped()
                            
                            Picker("", selection: $inputSectonds){
                                ForEach(0 ..< MAX_INPUT_MIN_SEC){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .labelsHidden()
                            .fixedSize(horizontal: true, vertical: true)
                            .frame(width: geometry.size.width / 3, height: geometry.size.height, alignment: .center)
                            .clipped()
                            Spacer()
                        }
                        
                    }
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
