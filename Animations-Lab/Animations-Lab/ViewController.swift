//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

  class ViewController: UIViewController {
        
        var duration = 1.0
        var distance = 50.0
        
        lazy var blueSquare: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            return view
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
        
        lazy var leftButton: UIButton = {
             let button = UIButton()
              button.setTitle("Move square left", for: .normal)
              button.setTitleColor(.black, for: .normal)
              button.backgroundColor = .cyan
              button.frame = CGRect(x: 0, y: 650, width: 155, height: 55)
              button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
              return button
          }()
        
        lazy var rightButton: UIButton = {
           let button = UIButton()
            button.setTitle("Move square right", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .cyan
            button.frame = CGRect(x: 260, y: 650, width: 155, height: 55)
            button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
            return button
        }()
        
        lazy var animationTimeStepper: UIStepper = {
            var stepper = UIStepper()
            stepper.minimumValue = 0.5
            stepper.maximumValue = 10.0
            stepper.stepValue = 0.5
            stepper.frame = CGRect(x: 150, y: 100, width: 100, height: 40)
            stepper.addTarget(self, action: #selector(animationTimeStepperPressed(sender:)), for: .touchUpInside)
            return stepper
        }()
        
        lazy var animationDistanceStepper: UIStepper = {
              var stepper = UIStepper()
            stepper.minimumValue = 50.0
              stepper.maximumValue = 300.0
              stepper.stepValue = 10.0
              stepper.frame = CGRect(x: 150, y: 200, width: 100, height: 40)
              stepper.addTarget(self, action: #selector(animationDistanceStepperPressed(sender:)), for: .touchUpInside)
              return stepper
          }()
        
        
        lazy var timeStepperLabel: UILabel = {
               var label = UILabel()
               label.text = "Animation Time: \(duration)"
               label.frame = CGRect(x: 120, y: 50, width: 220, height: 40)
               return label
           }()
        
        lazy var distanceStepperLabel: UILabel = {
                  var label = UILabel()
                  label.text = "Animation Distance: \(distance)"
                  label.frame = CGRect(x: 120, y: 150, width: 220, height: 40)
                  return label
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
        
        @IBAction func animateSquareUp(sender: UIButton) {
            let oldOffset = blueSquareCenterYConstraint.constant
            blueSquareCenterYConstraint.constant = oldOffset - CGFloat(distance)
            UIView.animate(withDuration: duration) { [unowned self] in
                self.view.layoutIfNeeded()
            }
        }
        
        @IBAction func animateSquareDown(sender: UIButton) {
            let oldOffset = blueSquareCenterYConstraint.constant
            blueSquareCenterYConstraint.constant = oldOffset + CGFloat(distance)
            UIView.animate(withDuration: duration) { [unowned self] in
                self.view.layoutIfNeeded()
            }
        }
        
        @IBAction func animateSquareLeft(sender: UIButton) {
            let oldOffset = blueSquareCenterXConstraint.constant
            blueSquareCenterXConstraint.constant = oldOffset - CGFloat(distance)
            UIView.animate(withDuration: duration) { [unowned self] in
                self.view.layoutIfNeeded()
            }
        }
        
        @IBAction func animateSquareRight(sender: UIButton) {
            let oldOffset = blueSquareCenterXConstraint.constant
            blueSquareCenterXConstraint.constant = oldOffset + CGFloat(distance)
            UIView.animate(withDuration: duration) { [unowned self] in
                self.view.layoutIfNeeded()
            }
        }
        
        @IBAction func animationTimeStepperPressed(sender: UIStepper) {
            duration = sender.value
            timeStepperLabel.text = "Animation Time: \(sender.value)"
        }
        
        @IBAction func animationDistanceStepperPressed(sender: UIStepper) {
               distance = sender.value
               distanceStepperLabel.text = "Animation Distance: \(sender.value)"
           }
        
        
        private func addSubviews() {
            animationTimeStepper.value = duration
            animationDistanceStepper.value = distance
            view.addSubview(blueSquare)
            addStackViewSubviews()
            view.addSubview(buttonStackView)
            view.addSubview(animationTimeStepper)
            view.addSubview(timeStepperLabel)
            view.addSubview(leftButton)
            view.addSubview(rightButton)
            view.addSubview(animationDistanceStepper)
            view.addSubview(distanceStepperLabel)
        }
        
        private func addStackViewSubviews() {
            buttonStackView.addSubview(upButton)
            buttonStackView.addSubview(downButton)
        }
        
        private func configureConstraints() {
            constrainBlueSquare()
            constrainUpButton()
            constrainDownButton()
            constrainButtonStackView()
        }
        
        private func constrainUpButton() {
            upButton.translatesAutoresizingMaskIntoConstraints = false
            upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
        }
        
        private func constrainDownButton() {
            downButton.translatesAutoresizingMaskIntoConstraints = false
            downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    }
