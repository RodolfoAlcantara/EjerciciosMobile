//
//  MostrarNombreVC.swift
//  EjerciciosMobile
//
//  Created by Rodolfo Alcantara on 3/11/19.
//  Copyright © 2019 rodolfo. All rights reserved.
//

import UIKit

class MostrarNombreVC: UIViewController {
    @IBOutlet weak var lblNomnbre: UILabel!
    var nombreCompleto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let texto = nombreCompleto else { return }
        self.lblNomnbre.text = texto
    }
}
