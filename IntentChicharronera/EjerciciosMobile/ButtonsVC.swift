//
//  ButtonsVC.swift
//  EjerciciosMobile
//
//  Created by Rodolfo Alcantara on 3/10/19.
//  Copyright © 2019 rodolfo. All rights reserved.
//

import UIKit

class ButtonsVC: UIViewController {
    @IBOutlet weak var TFNombre: UITextField!
    @IBOutlet weak var TFApellido: UITextField!
    @IBAction func setTextAction(_ sender: Any) {
        guard let texto = TFNombre.text else { return }
        guard let apellido = TFApellido.text else { return }
        sendToViewController(fromViewController: self, nombre: texto, apellido: apellido)
    }
    private func sendToViewController(fromViewController: UIViewController, nombre: String, apellido: String) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        guard let VC = story.instantiateViewController(withIdentifier: "MostrarNombreVC") as? MostrarNombreVC else { return }
        VC.nombreCompleto = "\(nombre) \(apellido)"
        fromViewController.navigationController?.pushViewController(VC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
