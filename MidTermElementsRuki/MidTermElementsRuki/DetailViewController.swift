//
//  DetailViewController.swift
//  MidTermElementsRuki
//
//  Created by Rukiye Karadeniz on 12/8/16.
//  Copyright © 2016 Rukiye Karadeniz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var boilingLabel: UILabel!
    @IBOutlet weak var meltingLabel: UILabel!
    
    var endPoint = ""
    var theElement: Elements?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailLabel.text? = (theElement?.name)!
        self.symbolLabel.text? = (theElement?.symbol)!
        
        let weight: String = String((theElement?.weight)!)
        let boiling: String = String((theElement?.boiling)!)
        let melting: String =  String((theElement?.melting)!)


        self.weightLabel.text? = weight
        self.boilingLabel.text? = boiling
        self.meltingLabel.text? = melting
    }
    
    // I need to leave. I couldn't stay more because i have final today in school


    

    
}
