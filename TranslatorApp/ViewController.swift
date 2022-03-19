//
//  ViewController.swift
//  TranslatorApp
//
//  Created by Eldiiar on 14/3/22.
//

import UIKit
import SwiftGoogleTranslate

class ViewController: UIViewController {
    
    let model = HistoryModel()
    let second = HistoryViewController()
    
    var firstLanguage = "en"
    var secondLanguage = "ru"
        
    let historyButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.setTitle("See History", for: .normal)
        button.backgroundColor = UIColor(red: 0.451, green: 0.882, blue: 0.882, alpha: 1)
        button.addTarget(self, action: #selector(didChangeView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rotateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "rotate"), for: .normal)
        button.addTarget(self, action: #selector(didChangeImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageView1 : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "russia"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let imageView2 : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "united-kingdom"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let label1: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 5
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let label2: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.text = "Translation"
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 0.451, green: 0.882, blue: 0.882, alpha: 1)
        lbl.font = UIFont(name: "Roboto-Medium", size: 18)
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 5
        lbl.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let speakerImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "speaker"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.textAlignment = .center
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1)
        
        title = "iTranslator"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.451, green: 0.882, blue: 0.882, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(historyButton)
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(rotateButton)
        view.addSubview(speakerImage)
        view.addSubview(textField)
        
        textField.delegate = self
        
        SwiftGoogleTranslate.shared.start(with: "AIzaSyAvFd3Eq0GFprz_TabyTEP4zh4cxJJS8O0")
        
        setUpConstraints()
    }
    
    @objc func didChangeView() {
        let destination = HistoryViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func didChangeImage() {
        rotateButton.rotate()
        
        if imageView1.image == UIImage(named: "russia") {
            imageView1.image = UIImage(named: "united-kingdom")
            imageView2.image = UIImage(named: "russia")
            
            firstLanguage = "ru"
            secondLanguage = "en"
        } else {
            imageView1.image = UIImage(named: "russia")
            imageView2.image = UIImage(named: "united-kingdom")
        }
    }
    
    func setUpConstraints() {
        rotateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label1.snp.bottom).offset(30)
            make.width.equalTo(52)
            make.height.equalTo(52)
        }
        
        imageView1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalTo(label1.snp.centerY)
            make.width.equalTo(54)
            make.height.equalTo(52)
        }
        
        imageView2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalTo(label2.snp.centerY)
            make.width.equalTo(54)
            make.height.equalTo(52)
        }
        
        label1.snp.makeConstraints { make in
            make.left.equalTo(imageView1.snp.right).offset(10)
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(320)
            make.height.equalTo(80)
        }
        
        label2.snp.makeConstraints { make in
            make.left.equalTo(imageView1.snp.right).offset(10)
            make.top.equalTo(rotateButton.snp.bottom).offset(30)
            make.width.equalTo(320)
            make.height.equalTo(80)
        }
        
        speakerImage.snp.makeConstraints { make in
            make.bottom.equalTo(label2).offset(-3)
            make.right.equalTo(label2).offset(-5)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        historyButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
            make.width.equalTo(318)
            make.height.equalTo(52)
        }
        
        textField.snp.makeConstraints { make in
            make.edges.equalTo(label1).inset(5)
        }
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let first: String = textField.text ?? "Wrong"
        SwiftGoogleTranslate.shared.translate(textField.text ?? "Something is wrong", firstLanguage, secondLanguage) { [self] (text, error) in
            if let t = text {
                DispatchQueue.main.async {
                    self.label2.text = t
                    model.secondLanguage = t
                    self.second.getData(first: first, second: t)
                    //self.second.getData(model)
                }
            }
        }
        textField.text = ""
    }
}

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: (Double.pi * 2) / 2)
        rotation.duration = 0.5
        rotation.isCumulative = true
        rotation.repeatCount = 1.0
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
