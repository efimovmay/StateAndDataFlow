//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation
import SwiftUI

final class UserManager: ObservableObject {
    
    @AppStorage("isRegister") var isRegister: Bool?
    @AppStorage("name") var name: String?
    
}
