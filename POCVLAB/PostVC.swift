//
//  PostVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 02/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class PostVC: UIViewController ,UITableViewDataSource ,UITableViewDelegate  {

    @IBOutlet weak var postTV: UITableView!
      var posts : Array<Posts> = Array<Posts>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        self.getData()

        postTV.delegate = self
        postTV.dataSource = self
        postTV.register(UINib(nibName: "PostCell", bundle: nil),
                          forCellReuseIdentifier: "PostCell")

    }

    
    // Nombre de cellules
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.posts.count
    }
    
    
    
    // Affichage de la cellule
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            
            guard let cell:PostCell = tableView.dequeueReusableCell(withIdentifier:"PostCell", for: indexPath) as? PostCell else{
                fatalError("unexpected cell dequeued from tableView")
            }
            cell.albumNameLabel.text = self.posts[indexPath.row].title
            cell.bodyTextView.text = self.posts[indexPath.row].body
            cell.artisteName.isHidden = true
            return cell
            
            
    }
    
    // Hauteur de la cellule
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 163
    }
    
    
    
    
    
    //    afficher detailCrisis
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
               
    }
    
    //    reccuperation  des  donnees  pour le  chargment  de  la tableView
    func getData()  {
        
        Services.sharedSession.dataAccess.getPost(completionHandler: { status,object  in
            if (status == 1 ){
                self.posts = object as! Array<Posts>
                DispatchQueue.main.async {
                    self.postTV.reloadData()
                }
            }
        })
    }

    
}
