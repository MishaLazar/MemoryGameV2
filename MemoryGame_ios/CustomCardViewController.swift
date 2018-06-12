//
//  CustomCardViewController.swift
//  MemoryGame_ios
//
//  Created by admin on 10/06/2018.
//  Copyright © 2018 misha_mor. All rights reserved.
//

import UIKit
import Photos
class CustomCardViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBOutlet weak var btnAddImageToDeck: UIButton!
    @IBOutlet weak var btnRotateImg: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnGallery: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func btnActionOpenGallery(_ sender: Any) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined || photos == .authorized {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        var imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .photoLibrary;
                        imagePicker.allowsEditing = true
                        self.present(imagePicker, animated: true, completion: nil)
                    }
                } else {}
            })
        }
        
    }
    
    
    @IBAction func btnActionOpenCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func AddImageToDeck(_ sender: Any) {
        
       
        var imageData = UIImageJPEGRepresentation(imagePicked.image!, 0.6)
        var compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        var card = CardModel(cardName: "PicName", img: compressedJPGImage!)
        
        DeckEdit.manager.addCustomeCardToDeck(card: card)
        
    }
    
    @IBAction func saveButt(_ sender: Any) {
        var imageData = UIImageJPEGRepresentation(imagePicked.image!, 0.6)
        var compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        var alert = UIAlertView(title: "Wow",
                                message: "Your image has been saved to Photo Library!",
                                delegate: nil,
                                cancelButtonTitle: "Ok")
        alert.show()
        
        var card = CardModel(cardName: "PicName", img: compressedJPGImage!)
        
        DeckEdit.manager.addCustomeCardToDeck(card:card)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imagePicked.image = image
        
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func rotateImage(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.imagePicked.transform = CGAffineTransform(rotationAngle: (90.0 * .pi) / 90.0)
        })
    }

}

