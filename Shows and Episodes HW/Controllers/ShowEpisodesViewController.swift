//
//  ShowEpisodesViewController.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class ShowEpisodesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var episodesSearchBar: UISearchBar!
    var show: Show?
    var episodes = [Episode](){
        didSet{
            episodesTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episodeSetup = episodes[indexPath.row]
        guard let cell: UITableViewCell = episodesTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaultCell = UITableViewCell()
            defaultCell.textLabel?.text = episodeSetup.name
            return defaultCell
        }
        if let cell = cell as? CustomEpisodeTableViewCell{
            cell.EpisodePoster.image = #imageLiteral(resourceName: "defaultImage")
            cell.episodeName.text = episodeSetup.name
            cell.episodeSeason.text = "Season: \(episodeSetup.season)"
            if let episodeImage = episodeSetup.image?.medium{
                ImageAPIClient.manager.getImage(from: episodeImage, completionHandler: {cell.EpisodePoster.image = $0; cell.setNeedsLayout()}, errorHandler: {print($0)})
            }else{
                cell.EpisodePoster.image = #imageLiteral(resourceName: "defaultImage")
            }
            return cell
        }
        return cell

    }
    
    func loadEpisodes(){
        print("loading EPisode")
        guard let show = show else {
            return
        }
        EpisodeAPIClient.manager.getContacts(from: "http://api.tvmaze.com/shows/\(Int(show.show.id))/episodes", completionHandler: {self.episodes = $0}, errorHandler: {print($0)})
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.episodesTableView.delegate = self
        self.episodesTableView.dataSource = self
        self.episodesSearchBar.delegate = self
        if show != nil{
            self.loadEpisodes()
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EpisodeViewController{
            let episodeSetup = episodes[(episodesTableView.indexPathForSelectedRow?.row)!]
            destination.episode = episodeSetup
        }
    }
    

}
