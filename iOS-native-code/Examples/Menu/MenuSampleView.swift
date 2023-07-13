//
//  MenuSampleView.swift
//  iOS-native-code
//
//  Created by Mohanapriya on 02/06/23.
//

import SwiftUI

struct MenuSampleView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                VStack(alignment: .leading, spacing: 0) {
                    profileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    ForEach(SideMenuRowType.allCases, id: \.self) { row in
                        rowView(isSelected: selectedSideMenuTab == row.rawValue,
                                imageName: row.iconName,
                                title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(Color.white)
            }
            Spacer()
        }
        .background(Color.gray)
    }
    func profileImageView() -> some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Image("profile-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                Spacer()
            }
            Text("User Name")
                .font(FontFamily.NotoSans.bold.textStyle(.body))
                .foregroundColor(Asset.Assets.black.color)

            Text("IOS Developer")
                .font(FontFamily.NotoSans.bold.textStyle(.body))
                .foregroundColor(Asset.Assets.black.color.opacity(0.5))
        }
    }
    func rowView(isSelected: Bool,
                 imageName: String,
                 title: String,
                 hideDivider: Bool = false,
                 action: @escaping (() -> Void)) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(isSelected ? .purple : .white)
                        .frame(width: 5)

                    ZStack {
                        Image(systemName: imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? Asset.Assets.black.color : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(FontFamily.NotoSans.regular.textStyle(.body))
                        .foregroundColor(isSelected ? Asset.Assets.black.color : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white,
                                    .white],
                           startPoint: .leading, endPoint: .trailing)
        )
    }
}

struct MenuSampleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSampleView(selectedSideMenuTab: .constant(1), presentSideMenu: .constant(true))
    }
}
