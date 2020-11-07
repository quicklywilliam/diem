//
//  ContentView.swift
//  Diem WatchKit Extension
//
//  Created by William Henderson on 6/28/20.
//  Copyright © 2020 William Henderson. All rights reserved.
//

import SwiftUI
import ClockKit

struct ContentView: View {    
    var body: some View {
        ClockView(showsSeconds: true).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ComplicationContentView: View {
    var body: some View {
        ClockView(showsSeconds: false).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            CLKComplicationTemplateGraphicCircularView(
                ComplicationContentView())
                .previewContext()
            
            CLKComplicationTemplateGraphicCircularView(
                ComplicationContentView())
                .previewContext(faceColor: .green)
            
            CLKComplicationTemplateGraphicExtraLargeCircularView(
                ComplicationContentView())
                .previewContext(faceColor: .green)
        }
    }
}
