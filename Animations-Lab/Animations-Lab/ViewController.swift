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
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    lazy var timeStepper: UIStepper = {
        var stepper = UIStepper()
        stepper.minimumValue = 0.0
        stepper.maximumValue = 5.0
        stepper.stepValue = 1.0
        stepper.value = 2.0
        return stepper
    }()
    
    lazy var timeLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //FIXME: correct value on the label
        label.text = "Time of Animation"
        return label
    }()
    
    lazy var distanceStepper: UIStepper = {
        var stepper = UIStepper()
        stepper.minimumValue = 50.0
        stepper.maximumValue = 500.0
        stepper.stepValue = 50.0
        stepper.value = 100.0
        return stepper
    }()
    
    lazy var distanceLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //FIXME: correct value on the label
        label.text = "Distance to move the square"
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 30
        return buttonStack
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
    
    lazy var buttonStackView2: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 30
        return buttonStack
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func pickerHasChanged(sender: UIPickerView) {
        
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - CGFloat(distanceStepper.value)
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + CGFloat(distanceStepper.value)
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - CGFloat(distanceStepper.value)
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet + CGFloat(distanceStepper.value)
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func timeStepperChanged(sender: UIStepper) {
        timeStepper.value = sender.value
        //FIXME: Why cannot change value for label?
        timeLabel.text = "Time of Animation \(timeStepper.value)"
    }
    
    @IBAction func distanceStepperChanged(sender: UIStepper) {
        distanceStepper.value = sender.value
        //FIXME: Why cannot change value for label?
        distanceLabel.text = "Distance to move the square \(distanceStepper.value)"
    }
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        view.addSubview(pickerView)
        view.addSubview(timeStepper)
        view.addSubview(timeLabel)
        view.addSubview(distanceStepper)
        view.addSubview(distanceLabel)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        view.addSubview(buttonStackView2)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        buttonStackView2.addSubview(leftButton)
        buttonStackView2.addSubview(rightButton)
    }
    
    private func configureConstraints() {
        constrainPickerView()
        constrainBlueSquare()
        constrainTimeStepper()
        constrainTimeLabel()
        constrainDistanceLabel()
        constrainDistanceStepper()
        constrainUpButton()
        constrainDownButton()
        constrainLeftButton()
        constrainRightButton()
        constrainButtonStackView()
        constrainButtonStackView2()
    }
    
    private func constrainPickerView() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func constrainTimeStepper() {
        timeStepper.translatesAutoresizingMaskIntoConstraints = false
        
        timeStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        timeStepper.bottomAnchor.constraint(equalTo: leftButton.topAnchor, constant: -30).isActive = true
        timeStepper.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //timeStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        timeStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
    }
    
    private func constrainTimeLabel() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.centerXAnchor.constraint(equalTo: timeStepper.centerXAnchor).isActive = true
        
        timeLabel.bottomAnchor.constraint(equalTo: rightButton.topAnchor, constant: -30).isActive = true
        
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        timeLabel.leadingAnchor.constraint(equalTo: timeStepper.trailingAnchor, constant:  20).isActive = true
        
        timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    private func constrainDistanceLabel() {
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        distanceLabel.centerXAnchor.constraint(equalTo: distanceStepper.centerXAnchor).isActive = true
        
        distanceLabel.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: 30).isActive = true
        
        distanceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        distanceLabel.leadingAnchor.constraint(equalTo: distanceStepper.trailingAnchor, constant:  20).isActive = true
        
        distanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    private func constrainDistanceStepper() {
        distanceStepper.translatesAutoresizingMaskIntoConstraints = false
        
        distanceStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        distanceStepper.topAnchor.constraint(equalTo: downButton.bottomAnchor, constant: 30).isActive = true
        distanceStepper.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //timeStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        distanceStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
    }
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
        
        upButton.leadingAnchor.constraint(equalTo: rightButton.leadingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainRightButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainLeftButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        leftButton.trailingAnchor.constraint(equalTo: downButton.trailingAnchor).isActive = true
        
        leftButton.leadingAnchor.constraint(equalTo: buttonStackView2.leadingAnchor).isActive = true
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
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    private func constrainButtonStackView2() {
        buttonStackView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView2.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -30),
            buttonStackView2.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView2.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


