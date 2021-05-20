//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Philip on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {

    let photoInfoController = PhotoInfoController()

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    
    
    @IBOutlet weak var botLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            title = ""
            imageView.image = UIImage(systemName: "photo.on.rectangle")
            topLabel.text = ""
            botLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (result) in
            DispatchQueue.main.async {
            switch result {
            case .success(let photoInfo):
                self.updateUI(with: photoInfo)

            case .failure(let error):
                self.updateUI(with: error)
        }
        }
    }
    }

    
    func updateUI(with photoInfo: PhotoInfo) {
        photoInfoController.fetchImage(from: photoInfo.url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success (let image):
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.topLabel.text = photoInfo.description
                    self.botLabel.text = photoInfo.copyright
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
  
    }
    }
    


    func updateUI(with error: Error) {
        title = "Error fetching Photo"
        imageView.image = UIImage(systemName: "exclamationmark.octagon")
        topLabel.text = error.localizedDescription
        botLabel.text = ""
    }

    
    
    

}

