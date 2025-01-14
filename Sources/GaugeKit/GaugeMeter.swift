//
//  GaugeMeter.swift
//  GaugeComponents
//
//  Created by Anton Martinsson on 2021-07-30.
//

import SwiftUI

/**
 The circular meter of the gauge view.
 
 - Parameters:
 - value: An integer between 0 and 100 displayed inside the gauge, which also determines the position of the gauge's indicator.
 - colors: The colors that should be used in the gradient that wipes across the gauge.
 - maxValue: The value the gauge should top out at.
 - minValue: The value the gauge should start at.
 */

struct GaugeMeter : View {
  let value: Double?
  let colors: [Color]
  let maxValue: Int?
  let minValue: Int?
  
  let trimStart = 0.1
  let trimEnd = 0.9
  let progressTo: Double
  
  init(value: Double? = nil, maxValue: Int? = nil, minValue: Int? = nil, colors: [Color]) {
    self.colors = colors
    self.value = value
    let defaultMaxValue = maxValue == nil && value != nil
    let defaultMinValue = minValue == nil && value != nil
    self.maxValue = defaultMaxValue ? 100 : maxValue
    self.minValue = defaultMinValue ? 0 : minValue
    
    let unwrappedMin = Double(minValue ?? 0)
    let unwrappedMax = Double(maxValue ?? 100)
    let unwrappedValue = value ?? 0
    let percentage = (Double(unwrappedValue) - unwrappedMin) / (unwrappedMax - unwrappedMin)
    self.progressTo = percentage * (trimEnd - trimStart) + trimStart
  }
  
  init(value: Int? = nil, maxValue: Int? = nil, minValue: Int? = nil, colors: [Color]) {
    self.colors = colors
    self.value = Double(value ?? 0)
    let defaultMaxValue = maxValue == nil && value != nil
    let defaultMinValue = minValue == nil && value != nil
    self.maxValue = defaultMaxValue ? 100 : maxValue
    self.minValue = defaultMinValue ? 0 : minValue
    
    let unwrappedMin = Double(minValue ?? 0)
    let unwrappedMax = Double(maxValue ?? 100)
    let unwrappedValue = value ?? 0
    let percentage = (Double(unwrappedValue) - unwrappedMin) / (unwrappedMax - unwrappedMin)
    self.progressTo = percentage * (trimEnd - trimStart) + trimStart
  }
  
  var body: some View {
    let startAngle = 360 * trimStart
    let endAngle = 360 * trimEnd
    
    ZStack {
      GeometryReader { geometry in
        let gradient = Gradient(colors: colors)
        let meterThickness = geometry.size.width / 14
        
        AngularGradient(
          gradient: Gradient(colors: [Color(hue: 0, saturation: 0, brightness: 0.85
                                           )]),
          center: .center,
          startAngle: .degrees(startAngle),
          endAngle: .degrees(endAngle)
        )
        .mask(
          GaugeMask(
            trimStart: trimStart,
            trimEnd: trimEnd,
            meterThickness: meterThickness
          )
        )
        .rotationEffect(Angle(degrees: 90))
        
        AngularGradient(
          gradient: gradient,
          center: .center,
          startAngle: .degrees(startAngle),
          endAngle: .degrees(endAngle)
        )
        .mask(
          GaugeMask(
            trimStart: trimStart,
            trimEnd: progressTo,
            meterThickness: meterThickness
          )
        )
        .rotationEffect(Angle(degrees: 90))
      }
    }
    .aspectRatio(1, contentMode: .fit)
  }
}

/** A circular view used as a mask over the angular gradient of the GaugeMeter.
 
 - Parameters:
 - trimStart: A double between 0 and 1 that determines where the meter should begin.
 - trimEnd: A double between 0 and 1 that determines where the meter should end.
 - meterThickness: The thickness of the gauge meter.
 */
private struct GaugeMask: View {
  let trimStart: Double
  let trimEnd: Double
  let meterThickness: Double
  
  var body: some View {
    Circle()
      .trim(from: CGFloat(trimStart), to: CGFloat(trimEnd))
      .stroke(style: StrokeStyle(lineWidth: CGFloat(meterThickness),
                                 lineCap: .round))
      .padding(CGFloat(meterThickness))
      .scaleEffect(0.8)
  }
}

struct GaugeComponents_Previews: PreviewProvider {
  static var previews: some View {
    let colors: [Color] = [.red, .orange, .yellow, .green]
    GaugeView(title: "Speed", value: 38.4, maxValue: 43, minValue: 34, colors: colors)
  }
}
