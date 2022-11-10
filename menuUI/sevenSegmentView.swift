//
//  sevenSegmentView.swift
//  menuUI
//
//  Created by Michelle Alexandra on 09/11/22.
//

import PolyKit
import SwiftUI

struct sevenSegmentView: View {
    init(_ text: String, isActive: Bool) {
        self.text = text
        self.isActive = isActive
    }
    
    var text:String
    var isActive:Bool
    
    var body: some View {
        VStack {
            GeometryReader {
                (proxy:GeometryProxy) in
                Text(self.text)
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    .background(self.isActive ? Color.red : Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(proxy.size.width / 2)
            }
        }.padding()
    }
}

struct sevenSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        sevenSegmentView(<#String#>, isActive: <#Bool#>)
    }
}
