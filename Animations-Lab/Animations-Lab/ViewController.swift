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
    
    lazy var timeStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0.0
        stepper.maximumValue = 5.0
        stepper.stepValue = 1.0
        stepper.value = 2.0
        return stepper
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //FIXME: correct value on the label
        //label.text = "Time of Animation"
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
        timeLabel.text = "Time of Animation \(timeStepper.value)"
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - 100
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet + 100
        UIView.animate(withDuration: timeStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func timeStepperChanged(sender: UIStepper) {
        timeStepper.value = sender.value
        //FIXME: Why cannot change value for label?
        timeLabel.text = "Time of Animation \(timeStepper.value)"
    }
    
//    alphaStepperLabel.value = sender.value
//    alphaValueLabel.text = "Alpha is \(String(format: "%.1f", alphaStepperLabel.value))"
//    view.backgroundColor = UIColor(red: CGFloat(redSliderLabel.value), green: CGFloat(greenSliderLabel.value), blue: CGFloat(blueSliderLabel.value), alpha: CGFloat(alphaStepperLabel.value))
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        view.addSubview(timeStepper)
        view.addSubview(timeLabel)
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
        constrainBlueSquare()
        constrainTimePickerView()
        constrainTimeLabel()
        constrainUpButton()
        constrainDownButton()
        constrainLeftButton()
        constrainRightButton()
        constrainButtonStackView()
        constrainButtonStackView2()
    }
    
    private func constrainTimePickerView() {
       timeStepper.translatesAutoresizingMaskIntoConstraints = false
        
        timeStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        timeStepper.topAnchor.constraint(equalTo: blueSquare.bottomAnchor, constant: 30).isActive = true
        timeStepper.heightAnchor.constraint(equalToConstant: 30).isActive = true
           //timeStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           
          timeStepper.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
       }
    
    private func constrainTimeLabel() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.centerXAnchor.constraint(equalTo: timeStepper.centerXAnchor).isActive = true
       
        timeLabel.topAnchor.constraint(equalTo: blueSquare.bottomAnchor, constant: 30).isActive = true
        
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        timeLabel.leadingAnchor.constraint(equalTo: timeStepper.trailingAnchor, constant:  20).isActive = true
        
        timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
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
        
        leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
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
            buttonStackView2.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -50),
            buttonStackView2.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView2.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}


