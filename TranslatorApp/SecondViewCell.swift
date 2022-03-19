//
//  SecondViewCell.swift
//  TranslatorApp
//
//  Created by Eldiiar on 15/3/22.
//

import UIKit
import SnapKit

class SecondViewCell: UITableViewCell {
    
    private let firstWord : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Roboto-Regular", size: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let translatedWord : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.451, green: 0.882, blue: 0.882, alpha: 1)
        lbl.font = UIFont(name: "Roboto-Medium", size: 18)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let image : UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "minus"))
        imgView.tintColor = .black
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let speakerImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "speaker"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(firstWord)
        addSubview(image)
        addSubview(translatedWord)
        addSubview(speakerImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(first: String, second: String) {
        firstWord.text = first
        translatedWord.text = second

        setUpConstraints()
    }
    
    func setUpConstraints() {
        firstWord.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(firstWord.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
        }
        
        translatedWord.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        speakerImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(-5)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
    }
    
}
