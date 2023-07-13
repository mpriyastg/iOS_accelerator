//
//  BaseSlider.swift
//  InterviewSwiftUI
//
//  Created by admin on 31/05/23.
//

import SwiftUI

enum SliderType {
    case border
    case plain
    case rotation
    case withImage
    case withButton
}
struct BaseSlider: View {
    @State var sliderType: SliderType = .plain
    @Binding var value: Double
    @State  var minValue: Double = 0.0
    @State  var maxValue: Double = 100.0
    @State  var startValue = ""
    @State  var endValue = ""
    @State var sliderColor: Color = .blue
    @State var borderColor: Color = .blue
    var thumbColor: UIColor = .white
    @State var sliderwidth: CGFloat = 350
    @State var startImage: Image = Image(systemName: "person.fill")
    @State var endImage: Image = Image(systemName: "person.fill")
    var body: some View {
        VStack {
            VStack {
                if sliderType == .plain {
                    Slider(value: $value, in: minValue...maxValue) {
                        Text("Slider")
                    } minimumValueLabel: {
                        Text(startValue)
                            .font(.title2)
                            .fontWeight(.thin)
                    } maximumValueLabel: {
                        Text(endValue)
                            .font(.title2)
                            .fontWeight(.thin)
                    }
                    .frame(width: sliderwidth)
                    .accentColor(sliderColor)
                    //                    .tint(sliderColor)
                    .padding()
                }
                if sliderType == .border {
                    Slider(value: $value, in: minValue...maxValue) {
                        Text("Slider")
                    }
                    .padding()
                    .frame(width: sliderwidth)
                    .accentColor(sliderColor)
                    //                    .tint(sliderColor)
                    .border(borderColor, width: 2)
                }
                VStack {
                    if sliderType == .rotation {
                        Slider(value: $value, in: minValue...maxValue) {
                            Text("Slider")
                        }
                        .padding()
                        .frame(width: sliderwidth)
                        //                        .tint(sliderColor)
                        .accentColor(sliderColor)
                        .border(borderColor, width: 2)
                        .rotationEffect(
                            .degrees(-90.0),
                            anchor: .center
                        )
                    }
                }
                if sliderType == .withImage {
                    Slider(value: $value, in: minValue...maxValue) {
                        Text("Slider")
                    } minimumValueLabel: {
                        startImage
                            .font(.title)
                            .foregroundColor(sliderColor)
                    } maximumValueLabel: {
                        endImage
                            .font(.title)
                            .foregroundColor(sliderColor)
                    }
                    .frame(width: sliderwidth)
                    .accentColor(sliderColor)
                    //                    .tint(sliderColor)
                    .padding()
                }
                if sliderType == .withButton {
                    Slider(value: $value, in: minValue...maxValue, label: { Text("Slider") }, minimumValueLabel: {
                        Button(action: {
                            self.decrementValue()
                        }, label: {
                            startImage
                                .font(.title)
                                .foregroundColor(sliderColor)
                        })
                    }, maximumValueLabel: {
                        Button(action: {
                            self.incrementValue()
                        }, label: {
                            endImage
                                .font(.title)
                                .foregroundColor(sliderColor)
                        })
                    })
                    .frame(width: sliderwidth)
                    .accentColor(sliderColor)
                    .padding()
                }
            }
        }
        .padding()
    }
    func incrementValue() {
        if value < 100 {
            value += 1
        }
    }
    func decrementValue() {
        if value > 0 {
            value -= 1
        }
    }
}

struct BaseSlider_Previews: PreviewProvider {
    static var previews: some View {
        BaseSlider(value: .constant(20))
    }
}
