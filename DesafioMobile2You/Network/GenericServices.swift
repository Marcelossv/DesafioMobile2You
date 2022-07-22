//
//  GenericServices.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 22/07/22.
//

import Foundation

protocol GenericService: AnyObject {
    typealias completion <T> = ( _ result: T,  _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case errorDescription(message: String, error: Swift.Error? = nil)
}
