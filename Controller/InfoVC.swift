//
//  InfoVCViewController.swift
//  Bull'sEye
//
//  Created by mac on 16/10/2021.
//

import UIKit
import WebKit

class InfoVC: UIViewController {
    
    //Mark:- OutLets
    
    
    
    @IBOutlet weak var myWebView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHTMLFile()
    }
    

   //Mark:- IBAction
    
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Mark:- Helper Functtions
    
    func loadHTMLFile(){
        
        
        guard let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") else {return}
        let htmlURL = URL(fileURLWithPath: htmlPath)
        let htmlURLRequest = URLRequest(url: htmlURL)
        myWebView.load(htmlURLRequest)
        
    }
}
