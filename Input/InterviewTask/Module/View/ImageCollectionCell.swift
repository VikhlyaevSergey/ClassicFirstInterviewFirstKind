//
//  ImageCollectionCell.swift
//  InterviewTask
//

import UIKit
import SnapKit

class ImageCollectionCell: UICollectionViewCell{
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension ImageCollectionCell{
    func configure(){
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
