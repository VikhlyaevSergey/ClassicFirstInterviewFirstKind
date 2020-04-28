//
//  UIImageView+Extension.swift
//  InterviewTask
//
//

import UIKit

extension UIImageView{
    
    func setImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
        
        // comment: это весьма удобное и типичное решение, если не задумываться о переиспользовании ячеек. Во время появления ячейки из-за края экрана, происходит использование ячейки, только что спрятавшейся за противоположной стороной экрана. При ЭТОМ решении можно столкнуться с тем, что:
        //  1. картинка не исчезла
        //  2. происходит постоянный вызов метода загрузки картинки.
        //  При больших объемах подгружаемых картинок лучше использовать SDWebImage. Там можно настроить хранение картинок в cache, что позволяет не загружать одну и ту же каринку несколько раз. В общем, очень удобный Framework, рекомендую
    }
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
