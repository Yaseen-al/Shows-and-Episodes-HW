//
//  ShowsViewController.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/3/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    var shows = [Show](){
        didSet{
            myTableView.reloadData()
        }
    }
    var searchTerm: String = " "{
        didSet{
            loadShows()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let showSetup = shows[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaulCell = UITableViewCell()
            defaulCell.textLabel?.text = showSetup.show.title
            return defaulCell
        }
        if let cell = cell as? CustomShowTableViewCell{
            cell.showName.text = showSetup.show.title
            cell.showPoster.image = #imageLiteral(resourceName: "defaultImage")
            if let showImage = showSetup.show.image?.original{
                // notice that you want to update the image in the completion handler as it is processed on the main quee
                ImageAPIClient.manager.getImage(from: showImage, completionHandler: {cell.showPoster.image = $0; cell.setNeedsLayout()}, errorHandler: {print($0)})
                cell.setNeedsLayout()
                return cell
            }else{
                cell.showPoster.image = #imageLiteral(resourceName: "defaultImage")
                return cell
            }
        }
        
        return cell
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       self.searchTerm = searchBar.text!.lowercased()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.searchTerm = searchText.lowercased()
    }
    func loadShows(){
        let modifiedSearchTerm = searchTerm.components(separatedBy: " ").joined(separator: "+")
        let urlStr = "http://api.tvmaze.com/search/shows?q=\(modifiedSearchTerm)"
        ShowAPIClient.manager.getShows(from: urlStr, completionHandler: {self.shows = $0}, errorHandler: {print($0)})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.mySearchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ShowEpisodesViewController {
            let showSetup = shows[(myTableView.indexPathForSelectedRow?.row)!]
            destination.show = showSetup
        }
    }
    

}
