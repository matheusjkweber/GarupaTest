//
//  ViewModelling.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

protocol ViewModelling: AnyObject {
    var state: ViewState<ButtonAction> { get set }
    func start()
}
