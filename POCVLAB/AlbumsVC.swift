//
//  AlbumsVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class AlbumsVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    
    @IBOutlet weak var albumsTV: UITableView!
    var album : Array<Albums> = Array<Albums>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
        getData()

        albumsTV.delegate = self
        albumsTV.dataSource = self
        
        albumsTV.register(UINib(nibName: "AlbumsCells", bundle: nil),
                        forCellReuseIdentifier: "AlbumsCells")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // Nombre de cellules
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.album.count
        
    }
    
    
    
    // Affichage de la cellule
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            guard let cell:AlbumsCells = tableView.dequeueReusableCell(withIdentifier:"AlbumsCells", for: indexPath) as? AlbumsCells else{
                fatalError("unexpected cell dequeued from tableView")
            }
            cell.titleAlbumLabel.text = album[indexPath.row].title
            cell.artiste.isHidden = true
            cell.getPhotoButton.isHidden = true
            return cell
            
    }
    
    // Hauteur de la cellule
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    //    afficher detailCrisis
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let postVC = PostVC(nibName: "PostVC", bundle: nil)
        self.navigationController?.pushViewController(postVC, animated: true)
        
    }
    
    
    //    reccuperation  des  donnees  pour le  chargment  de  la tableView
    func getData()  {
        
        Services.sharedSession.dataAccess.getAlbums(completionHandler: { status,object  in
            if (status == 1 ){
                self.album = object as! Array<Albums>
                DispatchQueue.main.async {
                    self.albumsTV.reloadData()
                }
            }
        })
    }

    
   
}
