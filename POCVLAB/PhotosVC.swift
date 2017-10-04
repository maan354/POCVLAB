//
//  PhotosVC.swift
//  POCVLAB
//
//  Created by NDIAYE on 03/10/2017.
//  Copyright © 2017 NDIAYE. All rights reserved.
//

import UIKit

class PhotosVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var photoTV: UITableView!
    var photos : Array<Photos> = Array<Photos>()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        photoTV.delegate = self
        photoTV.dataSource = self
        
        photoTV.register(UINib(nibName: "PhotosCell", bundle: nil),
                          forCellReuseIdentifier: "PhotosCell")
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Nombre de cellules
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.photos.count
        
    }
    
    
    
    // Affichage de la cellule
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            guard let cell:PhotosCell = tableView.dequeueReusableCell(withIdentifier:"PhotosCell", for: indexPath) as? PhotosCell else{
                fatalError("unexpected cell dequeued from tableView")
                
            }
            
            cell.titleLabel.text = self.photos[indexPath.row].title
            cell.imageBox.downloardImageFromUrl(from: (self.photos[indexPath.row].url))

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
        
        Services.sharedSession.dataAccess.getPhotos(completionHandler: { status,object  in
            if (status == 1 ){
                self.photos = object as! Array<Photos>
                DispatchQueue.main.async {
                    self.photoTV.reloadData()
                }
            }
        })
    }
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
