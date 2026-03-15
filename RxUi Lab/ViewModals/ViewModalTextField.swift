//
//  ViewModalTextField.swift
//  RxUi Lab
//
//  Created by Aadi Ahmed on 15/03/2026.
//

import RxSwift
import RxCocoa

class ViewModalTextField {
    let userName: BehaviorRelay<String>
    let userNameValid: Observable<Bool>
    let lblUserNameText: Driver<String>
    
    init(){
        let minLength = 3
        userName = BehaviorRelay(value: "")
        //to the user value exlicitly do this
        //userName.accept("1") // it will accept the value according to datatype
        userNameValid = userName
            .map { $0.count >= minLength}
            .share(replay: 1)
        
        lblUserNameText = userName
            .asDriver(onErrorJustReturn: "")
        	
    }
}
