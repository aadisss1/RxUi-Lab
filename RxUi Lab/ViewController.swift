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
    @IBOutlet weak var lblTwoMultiple: UILabel!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var lblUserName: UILabel!
    let disposeBag =  DisposeBag()
    let _viewModal =  viewModalOne()
    let viewModalTextField = ViewModalTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //bindLblOne()
        bindUiWithObserable()
        bindLblTwo()
        bindTextField()
    }
    func bindTextField(){
     
        //send text steam to userName in View Modal..... The data flow is TextField Username - > View Modal userName
        txtUserName.rx.text.orEmpty
                  .bind(to: viewModalTextField.userName)
                  .disposed(by: disposeBag)
        //userName from View Modal emits the stream and View controller this one subcscribe it to use the value
        viewModalTextField.userName
            .subscribe(onNext: { n in
                print(n)
            })
            .disposed(by: disposeBag)
        
        //Username Label from view Modal Emits the value of username and Label in View Controller that is lblUserName consumes it 
        viewModalTextField.lblUserNameText
            .drive(lblUserName.rx.text)
            .disposed(by: disposeBag)

        
    }
    
    func bindLblOne(){
        _viewModal.lblOneText.drive(lblOne.rx.text)
            .disposed(by: disposeBag)
       
    }
    func bindLblTwo () {
        _viewModal.lblTwoMultiple
            .map {$0.joined(separator: ", ")}
            .bind(to: lblTwoMultiple.rx.text)
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

