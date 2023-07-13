//
//  BaseList.swift
//  InterviewSwiftUI
//
//  Created by admin on 01/06/23.
//

import SwiftUI

enum ListType {
    case plain
    case section

}

struct BaseList: View {
    @State var listtype: ListType = .plain
    @State var arrList = [String]()
    @State var text = ""
    @State var img: Image = Image(systemName: "person.fill")
    @State var listwidth: CGFloat = 100
    @State var listheight: CGFloat = 100
    @State var selectedValue: String?
    var onSelection: ((String) -> Void)?

    var body: some View {
        VStack {
            if listtype == .plain {
                List {
                    ForEach(arrList, id: \.self) { objlist in
                        HStack(spacing: 10) {
                            img
                                .font(Font.system(size: 20))
                            BaseLabel(text: objlist,
                                      fontSize: 25,
                                      fontColor: Asset.Assets.black.color,
                                      fontWeight: .semibold)
                        }
                        .onTapGesture {
                            selectedValue = objlist
                            onSelection?(objlist)
                        }
                    }
                }
                .frame(width: listwidth, height: listheight)
            }

            if listtype == .section {
                List {
                    ForEach(arrList, id: \.self) { objlist in
                        Section(header: BaseLabel(text: text)) {
                            HStack(spacing: 10) {
                                img
                                    .font(Font.system(size: 20))
                                BaseLabel(text: objlist,
                                          fontSize: 25,
                                          fontColor: Asset.Assets.black.color,
                                          fontWeight: .semibold)
                            }
                            .onTapGesture {
                                selectedValue = objlist
                                onSelection?(objlist)
                            }
                        }
                    }
                }
                .frame(width: listwidth, height: listheight)
            }
        }
    }
}

struct BaseList_Previews: PreviewProvider {
    static var previews: some View {
        BaseList()
    }
}
