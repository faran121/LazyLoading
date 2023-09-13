//
//  ViewController.swift
//  LazyLoading&Caching
//
//  Created by Maliks on 12/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalsTableView: UITableView!
    
    var animals: [Animal]? = nil
    let animalResource: AnimalResource = AnimalResource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalsTableView.delegate = self
        animalsTableView.dataSource = self
        
        self.animalsTableView.register(UINib(nibName: String(describing: AnimalTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: AnimalTableViewCell.self))
                
        
        self.animalResource.getAnimals { (_animalResponse) in
            if _animalResponse?.animals != nil {
                self.animals = _animalResponse?.animals

                DispatchQueue.main.async {
                    self.animalsTableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.animals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AnimalTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell") as? AnimalTableViewCell
        
        cell.lblTitle.text = self.animals?[indexPath.row].name
        
        let imgURL = URL(string: (self.animals?[indexPath.row].image)!)!
        cell.imgTitle.loadImage(fromURL: imgURL, placeHolderImage: "PlaceHolder")
        
        return cell
    }
    
    
}

