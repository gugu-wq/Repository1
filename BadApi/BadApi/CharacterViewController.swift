//
//  CharacterViewController.swift
//  BadApi
//
//  Created by IACD-Air-10 on 2021/07/04.
//

import UIKit

//downloaded from the internet;
//used to download images from the net to your app
extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class CharacterViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    var character: CharacterDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLbl.text = character?.name
        attributeLbl.text = character?.birthday
        attackLbl.text = character?.nickname
        legsLbl.text = character?.status
        
        let urlString = (character?.img)!
        let url = URL(string: urlString)
        
        imageView.downloadedFrom(url: url!)
    }
}
