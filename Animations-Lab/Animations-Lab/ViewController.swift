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
        b.setTitle("Move square left", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.backgroundColor = .cyan
        b.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return b
    }()
    
    lazy var stepper: UIStepper = {
        let s = UIStepper()
        s.isEnabled = true
        s.stepValue = 1
        s.minimumValue = 1
        s.value = 2
        s.maximumValue = 5
        s.addTarget(self, action: #selector(changeTime(sender:)), for: .touchUpInside)
        return s
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
    
    var time: Double = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func changeTime(sender: UIStepper) {
        print("Changed time to \(sender.value)")
        time = sender.value
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: time) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: time) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: time) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset + 150
        UIView.animate(withDuration: time) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    private func addSubviews() {
        view.addSubview(blueSquare)
    }
    
    
    private func configureConstraints() {
        constrainBlueSquare()
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
        let stackview = UIStackView(arrangedSubviews: [upButton, stepper, downButton])
        stackview.distribution = .equalCentering
        stackview.axis = .horizontal
        stackview.spacing = 20
        
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 50.0)])
    }
    
    private func constrainButtonStackView2() {
        let stackview = UIStackView(arrangedSubviews: [leftButton, rightButton])
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
    
}


