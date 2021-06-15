//
//  DetailViewController.swift
//  StromViewer
//
//  Created by Terry Kuo on 2021/6/14.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var allpictures: Int?
    var selectedInt: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(selectedInt ?? 0) of \(allpictures ?? 11)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let image = selectedImage {
            
            imageView.image = UIImage(named: image)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
    

    

}
