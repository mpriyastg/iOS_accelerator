//
//  FilemanagerSample.swift
//  iOS-native-code
//
//  Created by admin on 16/06/23.
//

import SwiftUI
struct ItemModel: Codable, Identifiable {
    let id: Int
    let name: String
}
struct FilemanagerSample: View {
    // read json file
    let itemModel: [ItemModel] = Bundle.main.decodeJSON("covers.json")
    // read text file
    let textValue: String? = Bundle.main.decodeTEXT("sample3", withExtension: "txt")

    let filemanager = FileManagerHelper()
    var body: some View {

        ScrollView {
            VStack {
                // MARK: - Reaad text file From bundle

                // showing sample for text file reading in text
                Text(textValue ?? "No data found")
                    .multilineTextAlignment(.center)
                    .lineLimit(25)
                Divider()
                // MARK: - Read json file From bundle
                // showing the json from the bundel
                Text("Json Reader").fontWeight(.bold)
                    .foregroundColor(.red)
                ForEach(itemModel) { item in
                    Text(item.name)
                }

                // MARK: - Read json file from document directory
                Button {
                    _ =   filemanager.readJSONFromDocumentsDirectory(filename: "covers.json", type: [ItemModel].self)
                } label: {
                    Text("Tap to  read json from document").fontWeight(.bold)
                        .foregroundColor(.red)
                }
                .padding()

                // MARK: - Read image from document directory
                Button {
                    _ = filemanager.readImageFromDocumentsDirectory(filename: "test.png")
                }label: {
                    Text("Tap to read image file from document").fontWeight(.bold)
                        .foregroundColor(.red)
                }
                // MARK: - Read Text from document directory
                Button {
                    _ = filemanager.readTextFromDocumentsDirectory(filename: "sample3.txt")
                }label: {
                    Text("Tap to read text file from document").fontWeight(.bold)
                        .foregroundColor(.red)
                }                          .padding()

            }                .padding()
        }

    }
}

struct FilemanagerSample_Previews: PreviewProvider {
    static var previews: some View {
        FilemanagerSample()
    }
}
