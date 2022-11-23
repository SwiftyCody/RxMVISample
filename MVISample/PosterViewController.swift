//
//  ViewController.swift
//  MVISample
//
//  Created by Cody on 2022/11/22.
//

import UIKit
import SwiftUI
import SnapKit
import Then
import RxSwift
import RxCocoa

class PosterViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let intent = PosterViewIntent()
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.contentMode = .scaleAspectFit
    }
    
    let button = UIButton().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.setTitle("Get Poster!", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        bind()
    }
    
    func layout() {
        [imageView, button]
            .forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
    
    func bind() {
        intent.bind(to: self)
        button.rx.tap.bind {
            self.intent.getImageButtonTouched()
        }
        .disposed(by: disposeBag)
    }
}


// MARK: - for Preview

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        PosterViewControllerRepresentable()
    }
}

struct PosterViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = PosterViewController()
        
        return UINavigationController(rootViewController: viewController)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
