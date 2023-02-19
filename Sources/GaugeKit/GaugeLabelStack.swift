//
//  GaugeLabelStack.swift
//  GaugeLabelStack
//
//  Created by Anton Martinsson on 2021-07-30.
//

import SwiftUI

/**
 A simple vertical stack of labels to be stashed within the gauge view.
 
 - Parameters:
 - geometry: The frame of the container the label stack is contained within.
 - value: An integer between 0 and 100 displayed inside the gauge.
 -	title: A title to be displayed below the value.
 */
struct GaugeLabelStack: View {
  @Environment(\.valueLabelColor) var valueColor
  @Environment(\.titleLabelColor) var titleColor
  
  var value: Double?
  var title: String?
  var isInt: BooleanLiteralType
  
  var body: some View {
    GeometryReader { geometry in
      let isTaller = geometry.size.width < geometry.size.height
      let smallestDimension = isTaller ? geometry.size.width : geometry.size.height
      
      VStack {
        if let unwrappedValue = value {
          let specifier = isInt ? "%.0f" : "%.\(unwrappedValue > 10 || (unwrappedValue - Double(Int(unwrappedValue))) < 0.1 ? 0 : 1)f"
          
          
          Text("\(unwrappedValue, specifier: specifier)").fontWeight(.bold)
            .font(.system(size: smallestDimension / 4))
            .foregroundColor(valueColor)
          
        }
        if let unwrappedTitle = title {
          Text(unwrappedTitle)
            .fontWeight(.light)
            .font(.system(size: smallestDimension / 20))
            .foregroundColor(titleColor)
        }
      }
      .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }
    .aspectRatio(1, contentMode: .fit)
  }
}
