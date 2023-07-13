import SwiftUI

enum ToggleType {
    case plain
    case withImage
}
struct BaseToggle: View {
    @State var toggleType: ToggleType = .plain
    @Binding var isToggleOn: Bool
    @State var toogleColor: Color = .blue
    @State var text = ""
    @State var onImageToggle = ""
    @State var offImageToggle = ""
    @State var fontSize: CGFloat = 22
    var body: some View {
        VStack {
            if toggleType == .plain {
                Toggle(isOn: $isToggleOn) {
                    Text(isToggleOn ? "Turn on" : "Turn off")
                        .font(Font.system(size: 18))
                }
                .accentColor(toogleColor)
                .toggleStyle(.switch)
            }
            if toggleType == .withImage {
                Toggle(isOn: $isToggleOn) {
                    Text(isToggleOn ? "Turn on" : "Turn off")
                        .font(Font.system(size: 18))
                }
                .accentColor(toogleColor)
                .toggleStyle(CheckmarkToggleStyle(onImage: onImageToggle, offImage: offImageToggle))
            }
        }
        .padding()
    }
}

struct BaseToggle_Previews: PreviewProvider {
    static var previews: some View {
        BaseToggle(isToggleOn: .constant(false))
    }
}
struct CheckmarkToggleStyle: ToggleStyle {
    @State var onImage: String
    @State var offImage: String
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(systemName: configuration.isOn ? onImage : offImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(configuration.isOn ? .green : .gray)
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
