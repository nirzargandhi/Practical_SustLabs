//
//  Array+Extension.swift
//  Practical_SustLabs
//

//MARK: - Array Extension
extension Array {

    //MARK: - Indices Method
    func indices(where condition: (Element) throws -> Bool) rethrows -> [Int]? {

        var indicies: [Int] = []
        for (index, value) in lazy.enumerated() {
            if try condition(value) { indicies.append(index) }
        }

        return indicies.isEmpty ? nil : indicies
    }
}
