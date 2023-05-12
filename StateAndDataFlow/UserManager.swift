//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @AppStorage("isRegister") var isRegister: Bool = false
    @AppStorage("name") var name: String = ""
}
