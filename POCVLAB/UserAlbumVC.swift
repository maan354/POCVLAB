//
//  UserAlbumVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class UserAlbumVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var albumTV: UITableView!
    var album : Array<Albums> = Array<Albums>()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        albumTV.delegate = self
        albumTV.dataSource = self
        albumTV.register(UINib(nibName: "AlbumsCells", bundle: nil),
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
            cell.artiste.text = Services.sharedSession.dataAccess.selectedUserName
            cell.getPhotoButton.addTarget(self, action: #selector(self.getPhotos), for: .touchUpInside)
            cell.getPhotoButton.tag = indexPath.row
            
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
        
        Services.sharedSession.dataAccess.getUserAlbums(completionHandler: { status,object  in
            if (status == 1 ){
                self.album = object as! Array<Albums>
                DispatchQueue.main.async {
                    self.albumTV.reloadData()
                }
            }
        })
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func getPhotos(sender :UIControl)  {
        let photoVC = PhotosVC(nibName: "PhotosVC", bundle: nil)
         Services.sharedSession.dataAccess.selectedUser =  album[sender.tag].id
        self.present(photoVC, animated: true)
    }
}
