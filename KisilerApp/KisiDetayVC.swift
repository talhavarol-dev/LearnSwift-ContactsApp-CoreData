//
//  KisiDetayVC.swift
//  KisilerApp
//
//  Created by Talha Varol on 28.03.2022.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var kisiAdLabel: UILabel!
    @IBOutlet weak var kisiTelLabel: UILabel!
    
    
    var kisi: Rehber?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kisi{
            kisiAdLabel.text = k.kisi_ad
            kisiTelLabel.text = k.kisi_tel
        }
       
    }
    


}
