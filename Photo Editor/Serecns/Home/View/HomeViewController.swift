//
//  HomeViewController.swift
//  Photo Editor
//
//  Created by Shishir_Mac on 15/3/23.
//

import UIKit
import ZLImageEditor

class HomeViewController: UIViewController {
    var editImageToolView: UIView!
    var editImageDrawToolSwitch: UISwitch!
    var editImageClipToolSwitch: UISwitch!
    var editImageImageStickerToolSwitch: UISwitch!
    var editImageTextStickerToolSwitch: UISwitch!
    var editImageMosaicToolSwitch: UISwitch!
    var editImageFilterToolSwitch: UISwitch!
    var editImageAdjustToolSwitch: UISwitch!
    var pickImageBtn: UIButton!
    var resultImageView: UIImageView!
    var originalImage: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getNewPhotoButton: UIButton!
    @IBOutlet weak var editPhotoButton: UIButton!
    
    var resultImageEditModel: ZLEditImageModel?
    
    let config = ZLImageEditorConfiguration.default()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configImageEditor()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    func configImageEditor() {
        ZLImageEditorConfiguration.default()
            .imageStickerContainerView(ImageStickerContainerView())
            .fontChooserContainerView(FontChooserContainerView())
            .canRedo(true)
    }
    
    func drawToolChanged() {
        if config.tools.contains(.draw) {
            config.tools.removeAll { $0 == .draw }
        } else {
            config.tools.append(.draw)
        }
    }
    
    func clipToolChanged() {
        if config.tools.contains(.clip) {
            config.tools.removeAll { $0 == .clip }
        } else {
            config.tools.append(.clip)
        }
    }
    
    func imageStickerToolChanged() {
        if config.tools.contains(.imageSticker) {
            config.tools.removeAll { $0 == .imageSticker }
        } else {
            config.tools.append(.imageSticker)
        }
    }
    
    func textStickerToolChanged() {
        if config.tools.contains(.textSticker) {
            config.tools.removeAll { $0 == .textSticker }
        } else {
            config.tools.append(.textSticker)
        }
    }
    
    func mosaicToolChanged() {
        if config.tools.contains(.mosaic) {
            config.tools.removeAll { $0 == .mosaic }
        } else {
            config.tools.append(.mosaic)
        }
    }
    
    func filterToolChanged() {
        if config.tools.contains(.filter) {
            config.tools.removeAll { $0 == .filter }
        } else {
            config.tools.append(.filter)
        }
    }
    
    func adjustToolChanged() {
        if config.tools.contains(.adjust) {
            config.tools.removeAll { $0 == .adjust }
        } else {
            config.tools.append(.adjust)
        }
    }
    
    func continueEditImage() {
        guard let oi = self.originalImage else {
            return
        }
        self.editImage(oi, editModel: self.resultImageEditModel)
    }
    
    func editImage(_ image: UIImage, editModel: ZLEditImageModel?) {
        ZLEditImageViewController.showEditImageVC(parentVC: self, image: image, editModel: editModel) { [weak self] (resImage, editModel) in
            self?.photoImageView.image = resImage
            self?.resultImageEditModel = editModel
        }
    }
    
    
    // MARK: - IBAction
    @IBAction func getNewPhotoButtonAction(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.mediaTypes = ["public.image"]
        self.showDetailViewController(picker, sender: nil)
    }
    
    @IBAction func editPhotoButtonAction(_ sender: UIButton) {
        print("Edit Photo")
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            guard let image = info[.originalImage] as? UIImage else { return }
            self.originalImage = image
            self.editImage(image, editModel: nil)
        }
    }
    
}
