//
//  ViewController.swift
//  PhotoFrame
//
//  Created by Lucas da Silva Claros on 27/02/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    let imageUrlString = "https://picsum.photos/500"
    let backgroundColors:[UIColor] = [
        .systemPink,
        .red,
        .cyan,
        .green,
        .brown,
        .black,
        .gray,
        .magenta
    ]

    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var randButton: UIButton!
    @IBOutlet weak var imageViewContainer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actIndicator.hidesWhenStopped = true
        loadURLImage()
    }

    
    @IBAction func buttonPressed(_ sender: Any) {
        let newColor = backgroundColors.randomElement()
        view.backgroundColor = newColor
        view.reloadInputViews()
        loadURLImage()
    }
    
    func loadURLImage(){
        guard let url = URL(string: imageUrlString) else {
            return
        }
        self.imageViewContainer.image = nil
        self.actIndicator.startAnimating()
        getImage(url: url) { img in
            self.imageViewContainer.image = img
        }
    }
    
    func getImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let img = UIImage(data: data) {
                    self.actIndicator.stopAnimating()
                    completion(img)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }

}

//extension UIImageView {
//    func imageURL(_ url: String) {
//        let activityIndicator = UIActivityIndicatorView(style: .large)
//                activityIndicator.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
//                activityIndicator.hidesWhenStopped = true
//                activityIndicator.startAnimating()
//                activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//
//                activityIndicator.center = CGPoint(x: self.frame.size.width  / 2, y: self.frame.size.height / 2)
//
//                self.addSubview(activityIndicator)
//
//                self.sd_setImage(with: URL(string: url)) { (image, error, cacheType, url) in
//                    activityIndicator.stopAnimating()
//                }
//    }
//}
