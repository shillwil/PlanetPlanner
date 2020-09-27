//
//  ViewController.swift
//  Planet Planner
//
//  Created by Alex Shillingford on 9/25/20.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
	
	let gridView = GridView()
	let canvasView = PKCanvasView()
	let toolPicker = PKToolPicker.init()
	
	var drawing = PKDrawing()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setUpGridView()
		setUpCanvasView()
	}

	func setUpGridView() {
		view.addSubview(gridView)
		gridView.translatesAutoresizingMaskIntoConstraints = false
		gridView.backgroundColor = .white
		
		NSLayoutConstraint.activate([
			gridView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
			gridView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			gridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			gridView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40)
		])
	}
	
	func setUpCanvasView() {
		gridView.addSubview(canvasView)
		canvasView.translatesAutoresizingMaskIntoConstraints = false
		canvasView.delegate = self
		canvasView.drawing = drawing
		canvasView.alwaysBounceVertical = true
		canvasView.drawingPolicy = .anyInput
		toolPicker.setVisible(true, forFirstResponder: canvasView)
		toolPicker.addObserver(canvasView)
		
		NSLayoutConstraint.activate([
			canvasView.topAnchor.constraint(equalTo: view.topAnchor),
			canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		canvasView.backgroundColor = .clear
		canvasView.becomeFirstResponder()
	}
	
}

extension ViewController: PKToolPickerObserver {
	
}

extension ViewController: PKCanvasViewDelegate {
	
}
