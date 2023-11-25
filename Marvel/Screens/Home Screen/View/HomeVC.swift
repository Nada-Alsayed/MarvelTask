//
//  HomeVC.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import UIKit
import Kingfisher

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchStackView: UIStackView!
    @IBOutlet weak var moviesTableView: UITableView!
    
    //MARK: - Variables
    
    private let viewModel = HomeViewModel()
    private var isSearching: Bool = false
    private var isSelected = (-1,false)
    
    //MARK: - VCLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupTableView()
        getMovies()
    }
    private func setupTableView() {
        moviesTableView.register(UINib(nibName: TableViewCell.cellID, bundle: nil), forCellReuseIdentifier: TableViewCell.cellID)
    }

    private func getMovies() {
        //print("kk")
        viewModel.fetchMovies(url: URLCreator().getMoviesLIst()) { [weak self] in
            DispatchQueue.main.async {
                self?.moviesTableView.reloadData()
            }
        }
    }
    
}

//MARK: - Extension

extension HomeVC :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? viewModel.numberOfFilteredMovies : viewModel.numberOfMovies
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellID, for: indexPath) as!TableViewCell
        
        let index = indexPath.row

        let movie = isSearching ? viewModel.filteredMovie(at: index) : viewModel.movie(at: index)
        cell.configureCollapsedView(with: movie)
        
        if isSelected.0 != indexPath.row && isSelected.1 == false{
            print("nnn\(isSelected.1)")
            cell.expandedView.isHidden = false
            cell.collapsedView.isHidden = true
            cell.configureExpandedView(with: movie)
            print("5:\(isSelected.0)||\(isSelected.1)")

        }else if isSelected.0 == indexPath.row && isSelected.1 == false{
            print("nnn\(isSelected.1)")
            cell.expandedView.isHidden = false
            cell.collapsedView.isHidden = true
            cell.configureExpandedView(with: movie)
            print("4:\(isSelected.0)||\(isSelected.1)")

        }else if isSelected.1 == true{
            cell.expandedView.isHidden = true
            cell.collapsedView.isHidden = false
            cell.configureCollapsedView(with: movie)
            print("3:\(isSelected.0)||\(isSelected.1)")

        }
        
//        else{
//            print("mmm\(isSelected.1)")
//
//            cell.expandedView.isHidden = true
//            cell.collapsedView.isHidden = false
//            cell.configureCollapsedView(with: movie)
//        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (isSelected.0 != indexPath.row) && (isSelected.1 == false){
            isSelected.0 = indexPath.row
            isSelected.1 = true
            print("1:\(isSelected.0)||\(isSelected.1)")

        }else if(isSelected.0 == indexPath.row) && (isSelected.1 == true){
            isSelected.0 = indexPath.row
            isSelected.1 = false
            print("2:\(isSelected.0)||\(isSelected.1)")

        }else{
            print("uncoverd case")

        }

//        var id = viewModel.movie(at: indexPath.row).id ?? 00000
//        if viewModel.isMovieExist(movieID: id){
////           var storedMovie =  viewModel.getOneMovie(movieID: id)
////        var apiModel = Result()
////            apiModel.title = storedMovie.title
////            apiModel.prices?[0].price = storedMovie.price
////            apiModel.thumbnail?.path = storedMovie.movieImg
////            apiModel.format = storedMovie.format
////            apiModel.creators?.items?[0].name = storedMovie.creatorName
////            apiModel.creators?.items?[0].role = storedMovie.creatorRole
////            viewModel.replaceMovie(at: indexPath.row, movie: apiModel )
////
////            moviesTableView.reloadRows(at: [indexPath], with: .automatic)
//        }else{
//            print("kkkkkkkkk")
//            viewModel.insertMovie(movie: LocalMovie().convertRemoteModelToLocalModel(remoteMovie: viewModel.movie(at: indexPath.row)))
//        }
        moviesTableView.reloadData()
    }
}

// MARK: - Extension

extension HomeVC: UISearchBarDelegate {
    
    //MARK: - methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterMovies(by: searchText)
        isSearching = searchText.isEmpty ? false : true
        moviesTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
