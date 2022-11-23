//
//  GetImageViewIntent.swift
//  MVISample
//
//  Created by Cody on 2022/11/23.
//

import Foundation
import RxSwift
import RxRelay
import UIKit

class PosterViewIntent {
    let imageObserver = PublishRelay<UIImage>()
    let imageModel = ImageModel()
    let disposeBag = DisposeBag()
    
    var viewController: PosterViewController?
    
    func bind(to viewController: PosterViewController) {
        self.viewController = viewController
        
        imageObserver.subscribe(on: MainScheduler.instance)
            .subscribe { image in
                viewController.imageView.image = image
                viewController.imageView.backgroundColor = .clear
            }
            .disposed(by: disposeBag)
    }
    
    func getImageButtonTouched() {
        imageModel.getImage()
            .subscribe(onSuccess: { image in
                self.imageObserver.accept(image)
            }, onFailure: { error in
                print("error:", error)
            })
            .disposed(by: disposeBag)
    }
}
