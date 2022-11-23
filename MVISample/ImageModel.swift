//
//  GetImageModel.swift
//  MVISample
//
//  Created by Cody on 2022/11/23.
//

import Foundation
import RxSwift
import UIKit
import Alamofire

struct ImageModel {
    func getImage() -> Single<UIImage> {
        return Single.create { observer -> Disposable in
            AF.request("https://api.lorem.space/image/movie")
                .responseData { response in
                    switch response.result {
                    case let .success(imageData):
                        if let image = UIImage(data: imageData) {
                            observer(.success(image))
                        }
                        else {
                            fatalError()
                        }
                    case let .failure(error):
                        observer(.failure(error))
                    }
                }
            
            return Disposables.create()
            
        }
    }
}
