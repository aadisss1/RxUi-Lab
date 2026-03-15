//
//  viewModalArray.swift
//  RxUi Lab
//
//  Created by Aadi Ahmed on 15/03/2026.
//
import RxSwift
import RxCocoa

class viewModalArray {
    let countriesName: Observable<Array<String>>
    let names = ["Pakistan","Portugal","America","Afghanistan"]
    init(){
        countriesName = Observable.just(names)
            
    }
}
