//
//  FlixService.swift
//  Flix
//
//  Created by Subash Bhusal on 2/22/22.
//

import Foundation


class FlixService {
    static let shared = FlixService()
    
    func fetchMovies(completion: @escaping(([Movie]) -> Void)) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                  let moviesRaw = dataDictionary["results"] as! [[String:Any]]
                 var movies = [Movie]()
                 for rawData in moviesRaw {
                     let mov = Movie(title: rawData["title"] as! String, description: rawData["overview"] as! String, posterURL: rawData["poster_path"] as! String )
                     movies.append(mov)
                 }
                completion(movies)

             }
        }
        task.resume()
        
        
    }
}
