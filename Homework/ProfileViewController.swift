//
//  ViewController.swift
//  Homework
//
//  Created by Ivan Babich on 23.09.2018.
//  Copyright © 2018 Ivan Babich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var takePhotoButton: UIButton!
    @IBOutlet var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("EditButton frame: ", editButton.frame)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.layer.borderWidth = 1
        takePhotoButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let photoButtonHeight = takePhotoButton.frame.height
        takePhotoButton.layer.cornerRadius = photoButtonHeight / 2
        profileImageView.layer.cornerRadius = photoButtonHeight / 2
        profileImageView.layer.masksToBounds = true
        // Размер кнопки отличается, так как этот метод срабатывает, когда экран отобразился и авторазметка применилась, вследствие этого кнопка поменяла свои размеры.
        print("EditButton frame: ", editButton.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // При распечатывании возникает ошибка, так как на кнопку еще ничего не указывает, из-за того что метод init срабатывает раньше методов жизненного цикла ViewController
//        print("EditButton frame: ", editButton.frame)
    }
    
    @IBAction func takePhotoClicked() {
        print("Выбери изображение профиля")
        let alertController = UIAlertController(title: "Новое фото профиля", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Удалить", style: .destructive) { (alertAction) in
            self.profileImageView.image = UIImage(named: "placeholder-user")
        })
        alertController.addAction(UIAlertAction(title: "Сделать фото", style: .default) { (alertAction) in
            self.takePhoto()
        })
        alertController.addAction(UIAlertAction(title: "Установить из галереи", style: .default) { (alertAction) in
            self.openPhotoLibrary()
        })
        alertController.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
