//
//  HomePageVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var homeTV: UITableView!
    var users : Array<Users> = Array<Users>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home Page"
        self.getData()
        print(self.users)
        homeTV.delegate = self
        homeTV.dataSource = self
        homeTV.register(UINib(nibName: "HomeCell", bundle: nil),
                                 forCellReuseIdentifier: "HomeCell")
    }

    
    // Nombre de cellules
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    
    
    // Affichage de la cellule
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            guard let cell:HomeCell = tableView.dequeueReusableCell(withIdentifier:"HomeCell", for: indexPath) as? HomeCell else{
                fatalError("unexpected cell dequeued from tableView")
            }
            cell.userName.text = self.users[indexPath.row].username
            cell.name.text = self.users[indexPath.row].name
            cell.Email.text = self.users[indexPath.row].email
            cell.postButton.addTarget(self, action: #selector(self.getUserPost), for: .touchUpInside)
            cell.postButton.tag = indexPath.row
            cell.albumsButton.addTarget(self, action: #selector(self.getUserAlbum), for: .touchUpInside)
            cell.albumsButton.tag = indexPath.row
            
            return cell
            
            
    }
    
    // Hauteur de la cellule
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    
    //    afficher detailCrisis
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
            let albums = AlbumsVC(nibName: "AlbumsVC", bundle: nil)
            self.present(albums, animated: true)
          
    }
    
    //    reccuperation  des  donnees  pour le  chargment  de  la tableView
    func getData()  {
        
        Services.sharedSession.dataAccess.getUsers(completionHandler: { status,object  in
            if (status == 1 ){
                self.users = object as! Array<Users>
                DispatchQueue.main.async {
                    self.homeTV.reloadData()
                }
            }
        })
    }
    
    func getUserPost(sender : UIButton)  {
        let userPostVC = UserPostVC(nibName: "UserPostVC", bundle: nil)
        Services.sharedSession.dataAccess.selectedUser =   self.users[sender.tag].id
        Services.sharedSession.dataAccess.selectedUserName =   self.users[sender.tag].username
        self.present(userPostVC, animated: true)
    }
    
    
    func getUserAlbum(sender : UIButton)  {
        let userAlbumVC = UserAlbumVC(nibName: "UserAlbumVC", bundle: nil)
        Services.sharedSession.dataAccess.selectedUser =   self.users[sender.tag].id
        Services.sharedSession.dataAccess.selectedUserName =   self.users[sender.tag].username
        self.present(userAlbumVC, animated: true)
    }

}
