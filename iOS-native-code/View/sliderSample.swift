//
//  sliderSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

struct SliderSample: View {
    var body: some View {
        VStack {
            BaseSlider(sliderType: .plain,
                       value: 50,
                       minValue: 0,
                       maxValue: 100,
                       startValue: "0",
                       endValue: "100",
                       sliderColor: .red)
            Divider()
            BaseSlider(sliderType: .border,
                       value: 50,
                       minValue: 0,
                       maxValue: 100,
                       startValue: "0",
                       endValue: "100",
                       sliderColor: .blue)
            Divider()
            BaseSlider(sliderType: .withImage,
                       value: 50,
                       minValue: 0,
                       maxValue: 100,
                       startValue: "0",
                       endValue: "100",
                       sliderColor: .blue,
                       startImage: Image(systemName: "minus.square"),
                       endImage: Image(systemName: "plus.app") )
            Divider()
            BaseSlider(sliderType: .withButton,
                       value: 50,
                       minValue: 0,
                       maxValue: 100,
                       startValue: "0",
                       endValue: "100",
                       sliderColor: .blue,
                       startImage: Image(systemName: "minus.square"),
                       endImage: Image(systemName: "plus.app") )
            Spacer()
            BaseSlider(sliderType: .rotation,
                       value: 50,
                       minValue: 0,
                       maxValue: 100,
                       startValue: "0",
                       endValue: "100",
                       sliderColor: .green,
                       sliderwidth: 150)
            Spacer()
        }
    }
}
struct SliderSample_Previews: PreviewProvider {
    static var previews: some View {
        SliderSample()
    }
}
