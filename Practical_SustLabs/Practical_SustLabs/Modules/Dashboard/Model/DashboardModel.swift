//
//  DashboardModel.swift
//  Practical_SustLabs
//

struct DashboardModel : Codable {
    var hours : [Hours]?
    var day : String?

    enum CodingKeys: String, CodingKey {

        case hours = "hours"
        case day = "day"
    }

    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hours, forKey: .hours)
        try container.encode(day, forKey: .day)
    }

    init(hours : [Hours], day : String) {

        self.hours = hours
        self.day = day
    }
}

struct Hours : Codable {
    let hour : String?
    let record_count : Int?

    enum CodingKeys: String, CodingKey {

        case hour = "hour"
        case record_count = "record_count"
    }

    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hour, forKey: .hour)
        try container.encode(record_count, forKey: .record_count)
    }

    init(hour : String, record_count : Int) {

        self.hour = hour
        self.record_count = record_count
    }
}
