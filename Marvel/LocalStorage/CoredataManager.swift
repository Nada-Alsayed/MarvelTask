//
//  CoredataManager.swift
//  Marvel
//
//  Created by MAC on 25/11/2023.
//

import Foundation
import CoreData
import UIKit

class CoredataManager : CoredataManagerProtocol{
    
    var manager : NSManagedObjectContext!
    var moviesArray : [NSManagedObject] = []
    static let sharedInstance = CoredataManager()
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manager = appDelegate.persistentContainer.viewContext
    }
    
    func insertMovie(movieToInsert: LocalMovie) {
        let movieEntity = NSEntityDescription.entity(forEntityName: "MovieDetails", in: manager)
        let movie = NSManagedObject(entity: movieEntity ?? NSEntityDescription(), insertInto: manager)
        
        movie.setValue(movieToInsert.title, forKey: "title")
        movie.setValue(movieToInsert.movieImg, forKey: "movieImg")
        movie.setValue(movieToInsert.format, forKey: "format")
        movie.setValue(movieToInsert.price, forKey: "price")
        movie.setValue(movieToInsert.creatorName, forKey: "creatorName")
        movie.setValue(movieToInsert.creatorRole, forKey: "creatorRole")
        movie.setValue(movieToInsert.id, forKey: "id")

        do{
            try manager.save()
            print("movie : \(movie)")
            print("Recipe Saved!")
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    func getStoredMovies() -> [LocalMovie] {
        var movies = [LocalMovie]()
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "MovieDetails")

        do{
            moviesArray = try manager.fetch(fetch)
            
            for i in moviesArray{
                var myMovie = LocalMovie()
                myMovie.creatorRole = i.value(forKey: "creatorRole") as? String
                myMovie.creatorName = i.value(forKey: "creatorName") as? String
                myMovie.price = i.value(forKey: "price") as? Double
                myMovie.movieImg = i.value(forKey: "movieImg") as? String
                myMovie.format = i.value(forKey: "format") as? String
                myMovie.title = i.value(forKey: "title") as? String
                myMovie.id = i.value(forKey: "id") as? Int
                movies.append(myMovie)
            }

        }catch let error{
            print(error.localizedDescription)
        }

        return movies
    }
    
    func isMovieExist(movieID: Int) -> Bool {
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "MovieDetails")
        let predicate = NSPredicate(format: "id == %i", movieID )

        fetch.predicate = predicate
        
        do{
            moviesArray = try manager.fetch(fetch)
            if(moviesArray.count > 0){
                print("Movie is exist")
                return true
            }else{
                print("Movie is Not exist")
                return false
            }


        }catch let error{
            print(error.localizedDescription)
        }

        return false
    }
    
    func getOneMovie(movieID: Int) -> LocalMovie {
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "MovieDetails")
        let predicate = NSPredicate(format: "id == %i", movieID )

        fetch.predicate = predicate
        
        do{
            moviesArray = try manager.fetch(fetch)
            if(moviesArray.count > 0){
                print("Movie is exist")
                var myMovie = LocalMovie()
                myMovie.creatorRole = moviesArray[0].value(forKey: "creatorRole") as? String
                myMovie.creatorName = moviesArray[0].value(forKey: "creatorName") as? String
                myMovie.price = moviesArray[0].value(forKey: "price") as? Double
                myMovie.movieImg = moviesArray[0].value(forKey: "movieImg") as? String
                myMovie.format = moviesArray[0].value(forKey: "format") as? String
                myMovie.title = moviesArray[0].value(forKey: "title") as? String
                myMovie.id = moviesArray[0].value(forKey: "id") as? Int
                return myMovie
            }else{
                print("Movie is Not exist")
                return LocalMovie()
            }
        }catch let error{
            print(error.localizedDescription)
        }
        return LocalMovie()
    }
    
}
