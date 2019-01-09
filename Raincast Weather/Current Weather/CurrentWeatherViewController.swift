//
//  CurrentWeatherViewController.swift
//  Raincast Weather
//
//  Created by Malin Sundberg on 2019-01-05.
//  Copyright © 2019 Malin Sundberg. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    private var shouldDisplayAdditionalInfo: Bool = false {
        willSet {
            if newValue {
                UIView.animate(withDuration: 0.2, animations: {
                    self.currentWeatherLabel.alpha = 1.0
                    self.detailsButton.alpha = 1.0
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.currentWeatherLabel.alpha = 0.0
                    self.detailsButton.alpha = 0.0
                })
                
            }
        }
    }
    
    @IBAction func locationTextFieldTouchDownAction(_ sender: Any) {
        shouldDisplayAdditionalInfo = false
    }
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    
    @IBAction func displayWeatherButtonAction(_ sender: UIBarButtonItem) {
        setCurrentWeatherLabelText()
        shouldDisplayAdditionalInfo = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setInfoLabelText()
        shouldDisplayAdditionalInfo = false
    }
    
    private func setInfoLabelText() {
        infoLabel.text = Strings.CurrentWeatherTexts.infoText
    }
    
    private func setCurrentWeatherLabelText() {
        currentWeatherLabel.text = Strings.CurrentWeatherTexts.currentWeatherVancouverText
    }
}
