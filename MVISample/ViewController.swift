//
//  ViewController.swift
//  MVISample
//
//  Created by solgoon on 2022/11/22.
//

import UIKit
import SwiftUI
import SnapKit
import Then

class GetImageViewController: UIViewController {
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .lightGray
    }
    
    let button = UIButton().then {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        $0.setTitle("Get!!", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        layout()
    }
    
    func layout() {
        [imageView, button]
            .forEach { view.addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
}


struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
//            .ignoresSafeArea()
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = GetImageViewController()
        
        return UINavigationController(rootViewController: viewController)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
}
