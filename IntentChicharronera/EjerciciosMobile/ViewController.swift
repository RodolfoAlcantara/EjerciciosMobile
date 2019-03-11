//
//  ViewController.swift
//  EjerciciosMobile
//
//  Created by Rodolfo Alcantara on 2/1/19.
//  Copyright © 2019 rodolfo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedOptions: UISegmentedControl!
    @IBOutlet weak var TFValue: UITextField!
    @IBOutlet weak var lblNumeroCalculado: UILabel!
    @IBAction func calcularAction(_ sender: Any) {
        switch segmentedOptions.selectedSegmentIndex {
        case 0:
            guard let numeroObtenido = TFValue.text else { return }
            guard let numeroParseado = Int(numeroObtenido) else { return }
            lblNumeroCalculado.text = "\(fibonacci(numeroParseado))"
        case 1:
            guard let textoObtenido = TFValue.text else { return }
            lblNumeroCalculado.text = "\(isPalindrome(textoObtenido))"
        case 2:
            guard let numeroObtenido = TFValue.text else { return }
            guard let numeroParseado = Int(numeroObtenido) else { return }
            lblNumeroCalculado.text = "\(isPrime(numeroParseado))"
        case 3:
            guard let numeroObtenido = TFValue.text else { return }
            guard let numeroParseado = Int(numeroObtenido) else { return }
            wonderfullNumber(numero: numeroParseado)
        default:
            break
        }
    }
    /**
     Función recursiva optima para calculo de serie Fibonacci
     - parameters:
     - numero: Número a partir del cual se calcula la serie
     */
    public func fibonacci(_ numero: Int) -> Int {
        if numero > 1 {
            return fibonacci(numero - 1) + fibonacci(numero - 2)
        } else if numero == 1 {
            return 1
        } else if numero == 0 {
            return 0
        } else {
            return -1
        }
    }
    /**
     Función base para verificación de palindromo
     - parameters:
     - str: Cadena a comparar para saber si es palindromo
     - returns: Dato tipo Bool para saber si es o no palindromo
     */
    func isPalindrome(_ str: String) -> Bool {
        let strippedString = str.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
        let length = strippedString.count
        if length > 1 {
            return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
        }
        return false
    }
    /**
     Función auxiliar para comparación de cadena para verificación de palindromo
     - parameters:
     - str: cadena a comprar
     - left: posición izquierda del caracter
     - right: posición derecha del caracter
     */
    private func palindrome(_ str: String, left: Int, right: Int) -> Bool {
        if left >= right { return true }
        let lhs = str[str.index(str.startIndex, offsetBy: left)]
        let rhs = str[str.index(str.startIndex, offsetBy: right)]
        if lhs != rhs { return false }
        return palindrome(str, left: left + 1, right: right - 1)
    }
    /**
     Función para calculo de numero primo
     - parameters:
     - number: Número a comprar
     - returns: Estado de numero primo
     */
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    func wonderfullNumber(numero: Int) {
        var ciclo: Int = numero
        while ciclo > 1 {
            if ciclo % 2 == 0 {
                ciclo = ciclo/2
                print(ciclo)
            } else {
                ciclo = (3 * ciclo) + 1
                print(ciclo)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
