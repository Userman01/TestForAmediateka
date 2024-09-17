//
//  ReaderDelegate.swift
//  TestForAmediateka
//
//  Created by Петр Постников on 17.09.2024.
//

import Foundation

protocol ReaderDelegateProtocol: AnyObject {
    func didReadData(data: Data)
}

class ReaderDelegate: ReaderDelegateProtocol {
    
    func didReadData(data: Data) {
        print("\(data)")
    }
}
