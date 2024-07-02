//
//  ElyahAPI.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/30/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import Foundation

struct ElyahAPI {
    static fileprivate let baseURL = "https://v72.appcrates.co/influencer_app/api/"
    
    static func subscribe(json: [String: Any], completion: @escaping (Result<Response, Swift.Error>) -> ()) {
        guard let url = URL(string: "\(baseURL)/subscribe.php") else { return }

        Request.Post(url: url, json: json, type: Response.self) { response in
            switch response {
            case .success(let value):
                completion(.success(value as! Response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    fileprivate struct Request {
        static func Get<T: Decodable>(
            url: URL,
            type: T.Type,
            completion: @escaping (Result<Decodable, Swift.Error>) -> ()
        ) {
            URLSession.shared.dataTask(with: url) { data, response, err in
                decodeData(data: data, err: err, type: type, completion: completion)
            }.resume()
        }

        static func Post<T: Decodable>(
            url: URL,
            json: [String: Any],
            type: T.Type,
            completion: @escaping (Result<Decodable, Swift.Error>) -> ()
        ) {
            var jsonData: Data
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
            } catch let jsonError {
                return completion(.failure(jsonError))
            }

            session.uploadTask(with: request, from: jsonData) { data, response, err in
                decodeData(data: data, err: err, type: type, completion: completion)
            }.resume()
        }

        fileprivate static func decodeData<T: Decodable>(
            data: Data?,
            err: Error?,
            type: T.Type,
            completion: @escaping (Result<Decodable, Swift.Error>) -> ()
        ) {
            if let err = err {
                return completion(.failure(err))
            }

            do {
                let result = try JSONDecoder().decode(ApiError.self, from: data!)
                return completion(.failure(AppError.custom(errorDescription: result.error)))
            } catch {}

            do {
                let call = try JSONDecoder().decode(type, from: data!)
                return completion(.success(call))
            } catch let jsonError {
                return completion(.failure(jsonError))
            }
        }
    }
    
    struct ApiError: Decodable {
        let error: String
    }

    struct Response: Decodable {
        let code: Int
        let message: String

        init(code: Int, message: String) {
            self.code = code
            self.message = message
        }
    }
}


enum AppError {
    case custom(errorDescription: String?)
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .custom(let errorDescription): return errorDescription
        }
    }
}
