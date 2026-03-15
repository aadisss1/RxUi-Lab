//
//  viewModalOne.swift
//  RxUi Lab
//
//  Created by Aadi Ahmed on 14/03/2026.
//
import RxSwift
import RxCocoa

class viewModalOne {
    let lblOneText: Driver<String>
    let lblTwoMultiple : Observable<[String]>
    init() {
        lblOneText = Observable.just("Hello for Observable")
            .asDriver(onErrorJustReturn: "Error")
        
        lblTwoMultiple = Observable.of([
            "Portugal",
            "Paksitan",
            "America"
            ]
            
        )
        
       
    }
}
