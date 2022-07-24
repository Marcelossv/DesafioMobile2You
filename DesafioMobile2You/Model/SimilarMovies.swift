//
//  SImilarMovies.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 23/07/22.


import Foundation

// MARK: - SimilarMovies
struct SimilarMovies: Codable {
    let page: Int
    let results: [Result]
    let total_pages, total_results: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case total_pages
        case total_results
    }
}

// MARK: SimilarMovies convenience initializers and mutators

extension SimilarMovies {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SimilarMovies.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        page: Int? = nil,
        results: [Result]? = nil,
        total_pages: Int? = nil,
        total_results: Int? = nil
    ) -> SimilarMovies {
        return SimilarMovies(
            page: page ?? self.page,
            results: results ?? self.results,
            total_pages: total_pages ?? self.total_pages,
            total_results: total_results ?? self.total_results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: original_language
    let original_title, overview: String
    let popularity: Double
    let poster_path, release_date, title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case id
        case original_language
        case original_title
        case overview, popularity
        case poster_path
        case release_date
        case title, video
        case vote_average
        case vote_count
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Result.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        adult: Bool? = nil,
        backdrop_path: String? = nil,
        genre_ids: [Int]? = nil,
        id: Int? = nil,
        original_language: original_language? = nil,
        original_title: String? = nil,
        overview: String? = nil,
        popularity: Double? = nil,
        poster_path: String? = nil,
        release_date: String? = nil,
        title: String? = nil,
        video: Bool? = nil,
        vote_average: Double? = nil,
        vote_count: Int? = nil
    ) -> Result {
        return Result(
            adult: adult ?? self.adult,
            backdrop_path: backdrop_path ?? self.backdrop_path,
            genre_ids: genre_ids ?? self.genre_ids,
            id: id ?? self.id,
            original_language: original_language ?? self.original_language,
            original_title: original_title ?? self.original_title,
            overview: overview ?? self.overview,
            popularity: popularity ?? self.popularity,
            poster_path: poster_path ?? self.poster_path,
            release_date: release_date ?? self.release_date,
            title: title ?? self.title,
            video: video ?? self.video,
            vote_average: vote_average ?? self.vote_average,
            vote_count: vote_count ?? self.vote_count
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum original_language: String, Codable {
    case en = "en"
    case ja = "ja"
    case sv = "sv"
    case fr = "fr"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
