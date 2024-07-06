//
//  Networkservice.swift
//  NetworkInterchangable
//
//  Created by Furkan İSLAM on 6.07.2024.
//

import Foundation

protocol Networkservice {
    
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
    
}
