//
//  OrderReader.swift
//  TestForAmediateka
//
//  Created by Петр Постников on 17.09.2024.
//

import Foundation

final class OrderReader {
    private var reader: ReaderProtocol
    
    init(reader: ReaderProtocol) {
        self.reader = reader
    }

    func read(_ uRLForFile: URL?) {
        self.reader.read(uRLForFile: uRLForFile, completion: { [weak self] result in
            switch result {
            case let .success(string):
                print(string)
                self?.didComplete()
            case let .failure(error):
                print(error.description)
            }
        })
    }

    private func didComplete() {
        print("end of file")
    }
}
