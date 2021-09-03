//
//  File.swift
//  File
//
//  Created by Anton Martinsson on 2021-09-03.
//
//  This extension houses the three custom initializers one can create a gauge with.

import Foundation
import SwiftUI

extension Gauge {
	
	/**
	 Initializes a gauge with a string, a value and an array of colors to create a background gradient from.
	 
	 - Parameters:
			- title: A short title that will be displayed in the center of the gauge, below its value.
			- value: An integer between 0 and 100 to visualize using the gauge.
			- colors: An array of Color instances to create the gauge's background gradient from..
	 */
	init(title: String?, value: Int?, colors: [Color]) {
		self.title = title
		self.value = value
		self.colors = colors
		self.additionalInfo = nil
	}
	
	/**
	 Initializes a gauge with a string, a value, an array of colors to create a background gradient from,
	 as well as some additional information to display on the back of the gauge once it is tapped by the user..
	 
	 - Parameters:
			- title: A short title that will be displayed in the center of the gauge, below its value.
			- value: An integer between 0 and 100 to visualize using the gauge.
			- colors: An array of Color instances to create the gauge's background gradient from..
			- additionalInfo: A struct that contains three optional strings to display on the back of the gauge.
	 */
	init(title: String?, value: Int?, colors: [Color], additionalInfo: GaugeAdditionalInfo) {
		self.title = title
		self.value = value
		self.colors = colors
		self.additionalInfo = additionalInfo
	}
	
	/**
	 Initializes a very basic gauge without an indicator or title.
	 
	 - Parameters:
			- colors: An array of Color instances to create the gauge's background gradient from..
	 */
	init(colors: [Color]) {
		self.title = nil
		self.value = nil
		self.colors = colors
		self.additionalInfo = nil
	}
}
