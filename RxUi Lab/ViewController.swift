//
//  ViewController.swift
//  RxUi Lab
//
//  Created by Aadi Ahmed on 14/03/2026.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var lblOne: UILabel!
    let disposeBag =  DisposeBag()
    let _viewModal =  viewModalOne()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //bindLblOne()
        bindUiWithObserable()
    }
    
    func bindLblOne(){
        _viewModal.lblOneText.drive(lblOne.rx.text)
            .disposed(by: disposeBag)
       
    }
    func bindUiWithObserable(){
        _viewModal.lblOneText
            .asObservable()
            .subscribe(
                onNext: { x in
                    self.lblOne?.text = x
                },
                onError: { [weak self] error in
                    self?.onError(error)
                },
                onCompleted: { [weak self] in
                    self?.onCompleted()
                },
                onDisposed: { [weak self] in
                    self?.onDisposed()
                }
            )
            .disposed(by: disposeBag)
    }
    
    func onError(_ error: Error) {
        print("Error: \(error)")
    }

    func onCompleted() {
        print("Completed")
    }

    func onDisposed() {
        print("Disposed")
    }
    


}

