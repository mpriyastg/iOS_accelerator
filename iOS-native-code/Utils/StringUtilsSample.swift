//
//  StringUtilsSample.swift
//  iOS-native-code
//
//  Created by admin on 16/06/23.
//

import SwiftUI

struct StringUtilsSample: View {
    let stringWithNumbers = "abc123def456"
    let phoneNumber = "(123) 456-7890"

    var body: some View {
        ScrollView {
            VStack {

                VStack {
                    Text("Phone Number: \(phoneNumber.removeInvalidCharsFromPhoneNumber())")
                        .font(.title)
                        .padding()

                    Text("Numbers: \(stringWithNumbers.extractNumbersFromString)")
                        .font(.title)
                        .padding()
                    Text("hello".reverse())
                        .font(.title)
                        .padding()

                    Text("SwiftUI is amazing".contains(substring: "is") ? "Contains 'is'" : "Doesn't contain 'is'")
                        .font(.headline)
                        .padding()

                    Text("   Welcome   ".trimWhitespace())
                        .font(.subheadline)
                        .padding()
                }
                VStack {
                    Text("  test ")
                        .font(.title)
                        .padding()
                        .foregroundColor("   ".isBlank() ? .red : .blue)

                    Text("Hello, World!".split(separator: ", ")[1])
                        .font(.subheadline)
                        .padding()

                    Text("abc".repeatString(count: 3))
                        .font(.subheadline)
                        .padding()
                }
                VStack {
                    Text("Hello, world!".starts(with: "Hello") ? "Starts with 'Hello'" : "Doesn't start with 'Hello'")
                        .font(.subheadline)
                        .padding()
                    Text("Hello, world!".ends(with: "world") ? "Ends with 'world'" : "Doesn't end with 'world'")
                        .font(.subheadline)
                        .padding()
                    Text("Hello, world!".indexOf(substring: "world")?.description ?? "")
                        .font(.subheadline)
                        .padding()
                }
                VStack {
                    Text("Is valid email:\(String("hello@example.com").isValidEmail() ? "Yes" : "No")")
                        .font(.subheadline)
                        .padding()

                    Text("Base64 encoded: \(String("Hello").base64Encoded())")
                        .font(.subheadline)
                        .padding()
                    Text("Slugified: \(String("Hello World! test").slugify())")
                        .font(.subheadline)
                        .padding()

                }
            }
        }
    }
}

struct StringUtilsSample_Previews: PreviewProvider {
    static var previews: some View {
        StringUtilsSample()
    }
}
