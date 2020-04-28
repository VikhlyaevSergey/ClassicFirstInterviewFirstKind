//
//  ImageCollectionCell.swift
//  InterviewTask
//
//

import UIKit
import SnapKit

class ImageCollectionCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var activityIndecator: UIActivityIndicatorView!
    
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
        
        activityIndecator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        activityIndecator.center = self.center
        activityIndecator.hidesWhenStopped = true
        activityIndecator.color = .red
        self.addSubview(activityIndecator)
        activityIndecator.startAnimating()
        
        // imageView.addObserver(self, forKeyPath: "image", options: .new, context: nil)
        // comment: пример использования KVO для отслеживания изменения параметра image. При отлове этого события, будет вызываться метод
        // observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
        // это бывает очень удобно. Я пытался останавливать анимацию activityIndicator (о котором, кстати и речи не было в задании) при фактической вставке картинки, но SDWebImage "вставляет" картинку до фактического отображения картинки, так что искомого результата я тут не достиг. Тут надо было покопать в сторону работы блока completion у метода UIImageView.sd_setImage, но на этот момент я уже потратил много времени. Просто не стал кормить свой перфекционизм и оставил всё как есть.
    }
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil // comment: если этого не делать, картинка будет обновляться только в момент подгрузки новой картинки. Выглядит ужасно. Типичный case для jun-ов.
    }
    
    /*
    internal override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "image" && imageView.image != nil) {
            activityIndecator.stopAnimating()
        }
    }*/
}
