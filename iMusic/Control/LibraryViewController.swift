//
//  ViewController.swift
//  iMusic
//
//  Created by JustinXiang on 2021/01/17.
//  Copyright © 2021 JustinXiang. All rights reserved.
//

import UIKit

let libraryView = LibraryView()
var playerViewController: PlayerViewController!
var willPop = false

class LibraryViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class LibraryRootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = editButtonItem
        self.navigationController?.navigationBar.tintColor = .red
        
        libraryView.topTable.delegate = self
        libraryView.topTable.dataSource = self
        
        libraryView.collection.delegate = self
        libraryView.collection.dataSource = self
        
        self.title = "资料库"
    }
        
    private func setupViews(){
        
        view.addSubview(libraryView)
        
        libraryView.scroll.contentSize = libraryView.backView.bounds.size
        
        
        libraryView.translatesAutoresizingMaskIntoConstraints = false
        libraryView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        libraryView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        libraryView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        libraryView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        if defaults.object(forKey: "index") != nil {
            Current.index = defaults.integer(forKey: "index")
            libraryView.songNameLabel.text = Current.songName
            libraryView.imageView.image = UIImage(named: Current.songName)
        }
    }
    
    func updatePlayerBar() {
        libraryView.songNameLabel.text = Current.songName
        libraryView.imageView.image = UIImage(named: Current.songName)
        libraryView.playPauseButton.addTarget(playback, action: #selector(playback.switchPlayStatus), for: .touchUpInside)
        libraryView.forwardButton.addTarget(playback, action: #selector(playback.nextSong), for: .touchUpInside)
        buttonTimer = Timer.scheduledTimer(timeInterval: 0, target: playback!, selector: #selector(playback.setButtonImage(timer:)), userInfo: libraryView.playPauseButton, repeats: true)

        libraryView.imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popPlayerViewController))
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        libraryView.imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func popPlayerViewController() {
        willPop = true
        self.present(playerViewController, animated: true) {
            willPop = false
        }
    }
}

// MARK: UITableViewDataSource & UITableViewDelegate

extension LibraryRootViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CustomTableCell
        cell = CustomTableCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TableCell")
        if let label = cell.textLabel {
            label.text = "\(info[indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerTitle = ["播放列表", "艺人", "专辑", "歌曲"]
        let subViewController = SubviewController(controllerTitle[indexPath.row])
        self.navigationController?.pushViewController(subViewController, animated: true)
    }
}

extension LibraryRootViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionCell
        cell.imageView.image = UIImage(named: songs[indexPath.item].SongName)
        cell.songNameLabel.text = songs[indexPath.item].SongName
        cell.artistLabel.text = songs[indexPath.item].Artist
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Current.index = indexPath.item
        playerViewController = PlayerViewController()
        self.present(playerViewController, animated: true, completion: .none)
    }
}
