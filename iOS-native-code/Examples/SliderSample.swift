//
//  sliderSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

struct SliderSample: View {
    @State private var plainSliderValue = 50.0
    @State private var borderSliderValue = 50.0
    @State private var withButtonSliderValue = 50.0
    @State private var rotationSliderValue = 50.0
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    Text("Slider")
                        .font(Font.system(size: 22))
                        .fontWeight(.bold)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 20) {
                    // Plain Slider
                    Text("Plain Slider:")
                        .font(Font.system(size: 20))
                        .bold()
                        .foregroundColor(Asset.Assets.black.color)
                        .padding(.leading, 15)
                    Text("Slider Value: \(plainSliderValue, specifier: "%.f")")
                        .padding()
                    BaseSlider(sliderType: .plain,
                               value: $plainSliderValue,
                               minValue: 0,
                               maxValue: 100,
                               startValue: "0",
                               endValue: "100",
                               sliderColor: .red)
                    Divider()
                    Text("Border Slider:")
                        .font(Font.system(size: 20))
                        .bold()
                        .foregroundColor(Asset.Assets.black.color)
                        .padding(.leading, 15)
                    Text("Slider Value: \(borderSliderValue, specifier: "%.f")")
                        .padding()
                    BaseSlider(sliderType: .border,
                               value: $borderSliderValue,
                               minValue: 0,
                               maxValue: 100,
                               startValue: "0",
                               endValue: "100",
                               sliderColor: .blue)
                    Divider()
                    Group {
                        Text("Slider with Button:")
                            .font(Font.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.leading, 15)
                            Text("Slider Value: \(withButtonSliderValue, specifier: "%.f")")
                                .padding()
                            BaseSlider(sliderType: .withButton,
                                       value: $withButtonSliderValue,
                                       minValue: 0,
                                       maxValue: 100,
                                       startValue: "0",
                                       endValue: "100",
                                       sliderColor: .blue,
                                       startImage: Image(systemName: "minus.square"),
                                       endImage: Image(systemName: "plus.app"))
                            Divider()
                            Text("Slider with rotation effect:")
                                .font(Font.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.leading, 15)
                            Text("Slider Value: \(rotationSliderValue, specifier: "%.f")")
                                .padding()
                            BaseSlider(sliderType: .rotation,
                                       value: $rotationSliderValue,
                                       minValue: 0,
                                       maxValue: 100,
                                       startValue: "0",
                                       endValue: "100",
                                       sliderColor: .green,
                                       sliderwidth: 150).padding()
                    }
                }.padding()
            }
            .padding(.leading, 15)
        }
    }
}

struct SliderSample_Previews: PreviewProvider {
    static var previews: some View {
        SliderSample()
    }
}
