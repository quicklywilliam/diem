//
//  ComplicationController.swift
//  Diem WatchKit Extension
//
//  Created by William Henderson on 6/28/20.
//  Copyright © 2020 William Henderson. All rights reserved.
//

import ClockKit
import SwiftUI

class ComplicationController: NSObject, CLKComplicationDataSource {
    let complicationIdentifier = "Diem"

    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(createTimelineEntry(forComplication: complication, date: Date()))
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
    private func createTimelineEntry(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTimelineEntry {
        
        // Get the correct template based on the complication.
        var template : CLKComplicationTemplate
            
        if complication.family == .circularSmall {
            template = CLKComplicationTemplateGraphicCircularView(ComplicationContentView())
        } else if complication.family == .graphicCircular {
            template = CLKComplicationTemplateGraphicCircularView(ComplicationContentView())
        } else if complication.family == .extraLarge {
            template = CLKComplicationTemplateGraphicExtraLargeCircularView(ComplicationContentView())
        } else {
            fatalError("Unsupported complication template.")
        }
            
        // Use the template and date to create a timeline entry.
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
    }
    
}
