// ViewController.swift
//
// Created by GigabiteLabs on 10/22/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import UIKit
import FSInteractiveMap

class ViewController: UIViewController {
    var mapView: FSInteractiveMapView?
    var previouslyClickedLayer: CAShapeLayer?
    @IBOutlet weak var selectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        loadMapUI()
        setupClickHandler()
    }
    
    func loadMapUI() {
        // Do any additional setup after loading the view.
        let frame: CGRect = .init(x: 16, y: 166, width: self.view.frame.width - 32, height: 500)
        mapView = .init(frame: frame)
        mapView!.loadMap(SVGNamed.USA.rawValue, withColors: nil)
        self.view.addSubview(mapView!)
    }
    
    func setupClickHandler() {
        mapView?.clickHandler = {(identifier: String?, layer: CAShapeLayer?) -> Void in
            // if a previously interacted with layer
            // is set, zero out attributes
            if let prevClicked = self.previouslyClickedLayer {
                prevClicked.zPosition = 0
                prevClicked.shadowOpacity = 0
            }
            // overwrite prev with current
            self.previouslyClickedLayer = layer
            // setup the layer effect
            layer?.zPosition = 10
            layer?.shadowOpacity = 0.5
            layer?.shadowColor = UIColor.black.cgColor
            layer?.shadowRadius = 5
            layer?.shadowOffset = CGSize(width: 0, height: 0)
            
            // Attempt to get the identifier's
            // translated full name by ID using FSUtil.
            guard let selectionName  = FSUtil().nameFor(id: identifier) else {
                print("invalid name identifier: \(identifier ?? "nil id")")
                return
            }
            self.selectionLabel.text = "Selected: \(selectionName.capitalized)"
        }
    }
}

