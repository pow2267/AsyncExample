//
//  ViewController.swift
//  AsyncExample
//
//  Created by kwon on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지 뷰에 셋팅
        // https가 아니라 http이미지를 다운로드 받으려면 Info.plist에 App Transport Security Setting 밑에 다시 Add row -> All Arbitrary Loads 값을 YES로 설정해주면 됨
        
        let imageUrl: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")!
        
        OperationQueue().addOperation {
            // Data.init 메서드는 동기 메서드라서 이미지를 불러올 때까지 동작이 멈춤
            let imageData: Data = try! Data.init(contentsOf: imageUrl)
            let image: UIImage = UIImage(data: imageData)!
            
            OperationQueue.main.addOperation {
                // UI에 영향을 미치는 코드는 반드시 메인 스레드 내에서 동작해야 함
                self.imageView.image = image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

