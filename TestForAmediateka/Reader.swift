//
//  Reader.swift
//  TestForAmediateka
//
//  Created by Петр Постников on 17.09.2024.
//

import Foundation

protocol ReaderProtocol: AnyObject {
    func read(uRLForFile: URL?, completion: @escaping ((Result<String, CustomError>) -> Void))
}

final class Reader {
    
    private weak var delegate: ReaderDelegateProtocol?
    
    init(delegate: ReaderDelegateProtocol?) {
        self.delegate = delegate
    }
    
    private func getFile(_ uRLForFile: URL?) -> Data? {
        guard let uRLForFile else { return nil }
        let stringURL = uRLForFile.absoluteString.replacingOccurrences(of: "file://", with: "")
        let fileUrl = URL(fileURLWithPath: stringURL)
        return try? Data(contentsOf: fileUrl)
    }
}

extension Reader: ReaderProtocol {
    
    func read(uRLForFile: URL?, completion: @escaping ((Result<String, CustomError>) -> Void)) {
        guard 
            let data = getFile(uRLForFile)
        else {
            completion(.failure(CustomError(description: "Error"))) // использовать модификаторы доступа к строкам
            return
        }
        self.delegate?.didReadData(data: data)
        completion(.success("success")) // использовать модификаторы доступа к строкам
    }
}
