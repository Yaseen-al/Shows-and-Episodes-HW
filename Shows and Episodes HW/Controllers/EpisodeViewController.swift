//
//  EpisodeViewController.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/4/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeNameLabel: UILabel!

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeSummaryLabel: UITextView!
    @IBOutlet weak var episodeSeasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var episodeRunTimeLabel: UILabel!
    @IBOutlet weak var episodeAirdateLabel: UILabel!
    
    var episode: Episode?
    
    func setEpisodeEnviroment(){
        guard let episode = episode else {
            return
        }
        episodeNameLabel.text = episode.name
        self.episodeImage.image = #imageLiteral(resourceName: "defaultImage")
        episodeSeasonLabel.text = "Season: \(episode.season.description)"
        if let episodeImageUrl = episode.image?.original{
            ImageAPIClient.manager.getImage(from: episodeImageUrl, completionHandler: {self.episodeImage.image = $0}, errorHandler: {print($0)})
        }
        episodeRunTimeLabel.text = "Run Time: \(episode.runtime.description)"
        episodeAirdateLabel.text = "Air Date: \(episode.airdate.description)"
        episodeSummaryLabel.text = episode.summary
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEpisodeEnviroment()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
