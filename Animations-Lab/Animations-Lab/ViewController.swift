//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var upButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move square up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move square down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton: UIButton = {
        let b = UIButton()
        b.setTitle("Move square left", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .cyan
        b.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return b
    }()
    
    lazy var rightButton: UIButton = {
        let b = UIButton()
        b.setTitle("Move square right", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .cyan
        b.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return b
    }()
    
    lazy var timeStepper: UIStepper = {
        let s = UIStepper()
        s.stepValue = 1
        s.minimumValue = 1
        s.value = 2
        s.maximumValue = 5
        s.addTarget(self, action: #selector(changeTime(sender:)), for: .touchUpInside)
        return s
    }()
    
    lazy var distanceStepper: UIStepper = {
        let s = UIStepper()
        s.stepValue = 10
        s.minimumValue = 50
        s.value = 150
        s.maximumValue = 500
        s.addTarget(self, action: #selector(changeDistance(sender:)), for: .touchUpInside)
        return s
    }()
    
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    let animations = [UIView.AnimationOptions.curveEaseIn, .curveEaseInOut, .curveLinear, .transitionCurlUp, .transitionFlipFromLeft]
    
    var time: Double = 2
    var distance: Double = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func changeTime(sender: UIStepper) {
        print("Changed time to \(sender.value)")
        time = sender.value
    }
    
    @IBAction func changeDistance(sender: UIStepper) {
        distance = sender.value
        print(pickerView.selectedRow(inComponent: 0))
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - CGFloat(distance)
        let option = animations[pickerView.selectedRow(inComponent: 0)]
        UIView.animate(withDuration: time, delay: 0, options: [option], animations: { [unowned self] in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + CGFloat(distance)
        let option = animations[pickerView.selectedRow(inComponent: 0)]
        UIView.animate(withDuration: time, delay: 0, options: [option], animations: { [unowned self] in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset - CGFloat(distance)
        let option = animations[pickerView.selectedRow(inComponent: 0)]
        UIView.animate(withDuration: time, delay: 0, options: [option], animations: { [unowned self] in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset + CGFloat(distance)
        let option = animations[pickerView.selectedRow(inComponent: 0)]
        UIView.animate(withDuration: time, delay: 0, options: [option], animations: { [unowned self] in
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    private func addSubviews() {
        view.addSubview(blueSquare)
    }
    
    
    private func configureConstraints() {
        constrainBlueSquare()
        setupPickerView()
        constrainButtonStackView()
        constrainButtonStackView2()
    }
    
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        let stackview = UIStackView(arrangedSubviews: [upButton, timeStepper, downButton])
        stackview.distribution = .equalCentering
        stackview.axis = .horizontal
        stackview.spacing = 20
        
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.bottomAnchor.constraint(equalTo: pickerView.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 50.0)])
    }
    
    private func constrainButtonStackView2() {
        let stackview = UIStackView(arrangedSubviews: [leftButton, distanceStepper, rightButton])
        stackview.distribution = .equalCentering
        stackview.axis = .horizontal
        stackview.spacing = 20
        
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackview.heightAnchor.constraint(equalToConstant: 50.0)])
    }
    
    private func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 100)])
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Curve Ease In"
        case 1:
            return "Curve Ease In Out"
        case 2:
            return "Curve Linear"
        case 3:
            return "Transition Curl Up"
        case 4:
            return "Transition Flip From Left"
        default :
            return nil
        }
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
}

