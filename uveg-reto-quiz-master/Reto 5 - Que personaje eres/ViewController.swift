//
//  ViewController.swift
//  Reto 5 - Que personaje eres
//
//  Created by Forte Apps on 20/07/20.
//  Copyright © 2020 UVEG. All rights reserved.
//

import UIKit

struct ResultadoPersonaje  {
    let nombre: String
    let descripcion: String
    let image: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var preguntaLabel: UILabel!
    @IBOutlet weak var respuestaButton1: UIButton!
    @IBOutlet weak var respuestaButton2: UIButton!
    @IBOutlet weak var respuestaButton3: UIButton!
    @IBOutlet weak var miImageView: UIImageView!
    
    var preguntaActual = 1
    var respuestas: [String] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        mostrarPregunta()
    }
    
    func mostrarPregunta(){
        switch preguntaActual {
        case 1:
            preguntaLabel.text = "¿Cuàl es tu color favorito?"
            respuestas = ["Rojo", "Azul", "Verde"]
        case 2:
            preguntaLabel.text = "¿Què tipo de pelìcula prefieres?"
            respuestas = ["Acciòn", "Drama", "Comedia"]
        case 3:
            preguntaLabel.text = "¿Cuàl es tu animal favorito?"
            respuestas = ["Perro", "Gato", "Loro"]
        case 4:
            preguntaLabel.text = "¿Prefieres la ciudad o el campo"
            respuestas = ["Ciudad", "Campo", "Ambos"]
        case 5:
            preguntaLabel.text = "¿Cuàl es tu hobby favorito?"
            respuestas = ["Leer", "Deportes", "Cocinar"]
        default:
            mostrarResultado()
        }
        actualizarBotonesRespuesta()
        
    }
    
    func actualizarBotonesRespuesta() {
        if respuestas.count >= 3 {
            respuestaButton1.setTitle(respuestas[0], for: .normal)
            respuestaButton2
                .setTitle(respuestas[1], for:
                .normal)
            respuestaButton3
                .setTitle(respuestas[2], for:
                .normal)
        }
    }
    
    var respuestasUsuario: [String] = []
    
    @IBAction func seleccionarRespuesta(_ sender: UIButton) {
        let respuestaSeleccionada = sender.currentTitle ?? ""
        respuestasUsuario.append(respuestaSeleccionada)
        
        
        preguntaActual += 1
        if preguntaActual <= 5 {
            mostrarPregunta()
        } else {
            mostrarResultado()
        }
    }
    
    func mostrarResultado(){
        let resultado = determinarResultado()
        let alertController = UIAlertController(title: resultado.nombre, message: resultado.descripcion, preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak self] _ in
            self?.reiniciarCuestionario()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        miImageView.image = UIImage(named: resultado.image)
    }
    
    func determinarResultado() -> ResultadoPersonaje {
        guard respuestasUsuario.count == 5 else {
            return ResultadoPersonaje(nombre:"Personaje Desconocido", descripcion:"No fue posible determinar tu personaje con las respuestas dadas", image: "desconcido")
        }

        let respuesta1 = respuestasUsuario[0]
        let respuesta2 = respuestasUsuario[1]
        let respuesta3 = respuestasUsuario[2]
        let respuesta4 = respuestasUsuario[3]
        let respuesta5 = respuestasUsuario[4]
        
        //let respuesta3 = respuestas[2]
        if respuesta1 == "Rojo" && respuesta2 == "Acciòn" {
            return ResultadoPersonaje(nombre: "Iron Man", descripcion: "Eres Iron Man, un genio, multimillonario y filàntropo", image: "ironman")
        } else if respuesta1 == "Azul" && respuesta2 == "Drama" {
            return ResultadoPersonaje(nombre: "Batman", descripcion: "Eres Batman, el caballero oscuro, protector de Ghotam City", image: "batman")
        } else if respuesta1 == "Verde" && respuesta2 == "Comedia" {
            return ResultadoPersonaje(nombre: "Shrek", descripcion: "Eres Shrek, un ogro amante de la paz en su pantano", image: "shrek")
        } else if respuesta3 == "Perro" && respuesta4 == "Campo" && respuesta5 == "Leer" {
            return ResultadoPersonaje(nombre: "Bilbo Bolsòn", descripcion: "Eres Bilbo Bolsòn, un hobbit aventurero amante de la lectura", image: "bilbo")
        } else if respuesta3 == "Gato" && respuesta4 == "Ciudad" && respuesta5 == "Deportes" {
            return ResultadoPersonaje(nombre: "Catwoman", descripcion: "Eres Catwoman, una astuta ladrona con una conexiòn especial con los gatos", image: "catwoman")
        } else if respuesta3 == "Loro" && respuesta4 == "Ambos" && respuesta5 == "Cocinar" {
            return ResultadoPersonaje(nombre: "Remmy de Ratatouille", descripcion: "Eres Remy, un ratòn gourmet con talento culinario", image: "remmy")
        } else {
            return ResultadoPersonaje(nombre: "Personaje Desconocido", descripcion: "No fue posible determinar tu personaje con las respuestas dadas", image: "desconocido")
        }
    }
    
    func reiniciarCuestionario(){
        preguntaActual = 1
        respuestasUsuario.removeAll()
        mostrarPregunta()
        miImageView.image = UIImage(named: "desconocido")
    }

}

