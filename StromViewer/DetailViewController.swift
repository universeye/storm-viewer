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
    
    lazy var shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(selectedInt ?? 0) of \(allpictures ?? 11)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = shareButton
        
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
    

    @objc private func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No inage found")
            return
        }
        
        guard let imageTitle = selectedImage else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [imageTitle, image], applicationActivities: [])
        
        vc.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            
                if error != nil {
                    print("failed")
                    return
                }
                if completed {
                    print("success")
                    self.showAlert()
                }
            }
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem //only affects on ipad
        present(vc, animated: true, completion: nil)
    }
    
    
    func showAlert() {
        let ac = UIAlertController(title: "Success!", message: "Success", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in}))
        
        present(ac, animated: true, completion: nil)
    }
    
    

}
