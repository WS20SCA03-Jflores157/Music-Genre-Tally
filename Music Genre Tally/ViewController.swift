//
//  ViewController.swift
//  Music Genre Tally
//
//  Created by Jeffrey  on 4/10/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer = AVAudioPlayer();
    
    @IBOutlet weak var genreTitle: UILabel!
    
    @IBOutlet weak var genreImage: UIImageView!
    
    @IBOutlet var genreTally: [UILabel]!
    
    var counter: Int = 0
    
    struct Genre{
        var genreTitle:String
        var genreImageName:String
        var genreMusicFileName:String
    }
    
    let genres: [Genre] = [
    
    Genre(genreTitle: "Pop", genreImageName: "Pop Trolls", genreMusicFileName: "Pop Song"),
    Genre(genreTitle: "Funk", genreImageName: "Funk Troll", genreMusicFileName: "Funk Song"),
    Genre(genreTitle: "Classical", genreImageName: "Classical Troll", genreMusicFileName: "Classical Song"),
    Genre(genreTitle: "Techno", genreImageName: "Techno Troll", genreMusicFileName: "Techno Song"),
    Genre(genreTitle: "Country", genreImageName: "Country Troll", genreMusicFileName: "Country Song"),
    Genre(genreTitle: "Rock", genreImageName: "Rock Troll", genreMusicFileName: "Rock Song"),
    Genre(genreTitle: "Reggaeton", genreImageName: "Reggaeton Troll", genreMusicFileName: "Reggaeton Song"),
    Genre(genreTitle: "Yodeling", genreImageName: "Yodeling Troll", genreMusicFileName: "Yodeling Song"),
    Genre(genreTitle: "Smooth Jazz", genreImageName: "Smooth Jazz Troll", genreMusicFileName: "Smooth Jazz Song"),
    Genre(genreTitle: "K-Pop", genreImageName: "K-Pop Troll", genreMusicFileName: "K-Pop Song")
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTallyAndGenre()
    }
    
    func resetTallyAndGenre(){
        for genreLabelIndex in 0 ..< (genres.count) {
            genreTally[genreLabelIndex].text = "0"
        }
        
        genreTitle.text = "Pop"
        genreImage.image = UIImage(named: "Pop Trolls")
        
        let path: String = Bundle.main.path(forResource: "Pop Song", ofType: "mp3")!;
        print(path);

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path));
        } catch {
            print(error)
        }

        audioPlayer.numberOfLoops = -1;   //infinite loop
        audioPlayer.volume = 0.5;
        audioPlayer.play();
    }
    
    
    @IBAction func swipeToChangeGenre(_ sender: UISwipeGestureRecognizer) {
        
       counter += 1
       
        genreTitle.text = genres[counter].genreTitle
        genreImage.image = UIImage(named: genres[counter].genreImageName)
        
        let path: String = Bundle.main.path(forResource: genres[counter].genreMusicFileName, ofType: "mp3")!;
           print(path);

           do {
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path));
           } catch {
               print(error)
           }

           audioPlayer.numberOfLoops = -1;   //infinite loop
           audioPlayer.volume = 0.5;
           audioPlayer.play();
        
        if counter == 9{
            counter = -1
        }
        
    }
    
    @IBAction func chooseGenre(_ sender: UIButton) {
        
        for index in 0 ..< (genres.count){
            
            let imageName = genres[index].genreImageName
            
            if genreImage.image == UIImage(named: imageName){
                let currentGenreTally: Int = Int(genreTally[index].text!)!
                
                let newTally = currentGenreTally + 1
                
                genreTally[index].text = "\(newTally)"
                
            }
        }
    }
    
}

