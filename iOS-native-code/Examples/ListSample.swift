//
//  listSample.swift
//  InterviewSwiftUI
//
//  Created by admin on 01/06/23.
//

import SwiftUI

struct ListSample: View {
    var arrNumbers = ["one", "two", "three"]
    var body: some View {
        VStack {
            Text("List")
                .font(Font.system(size: 22))
                .fontWeight(.bold)
            Spacer().frame(height: 30)
            HStack {
                Text("List with text and image:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            BaseList(listtype: .plain, arrList: arrNumbers, listwidth: 400, listheight: 200) { selectedValue in
                print("Selected value: \(selectedValue)")
            }
                .listStyle(.sidebar)
                .padding()
            HStack {
                Text("List with section:")
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            BaseList(listtype: .section,
                     arrList: arrNumbers,
                     text: "Section",
                     listwidth: 400,
                     listheight: 200) { selectedValue in
                print("Selected value: \(selectedValue)")
            }
            .padding()
            .listStyle(.insetGrouped)
         Spacer()
        }

        }

}
struct ListSample_Previews: PreviewProvider {
    static var previews: some View {
        ListSample()
    }
}
