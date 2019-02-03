//
//  ViewController.swift
//  iOS-PhotoImport-App
//
//  Created by Fatih Canbekli on 3.02.2019.
//  Copyright © 2019 wealight. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        //Image View Shape
        myImageView.layer.cornerRadius = self.myImageView.frame.size.width / 2;
        myImageView.clipsToBounds = true;
        myImageView.layer.masksToBounds = true;
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ImportImage(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self;
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary;
        image.allowsEditing = false;
        
        self.present(image,animated: true){
            //After
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImageView.image = image;
        }else{
            //error
        }
        self.dismiss(animated: true, completion: nil);
    }
    
}

