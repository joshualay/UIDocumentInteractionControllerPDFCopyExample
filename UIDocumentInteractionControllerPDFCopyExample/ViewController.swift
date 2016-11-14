//
//  ViewController.swift
//  UIDocumentInteractionControllerPDFCopyExample
//
//  Created by Josh Lay on 14/11/2016.
//  Copyright © 2016 Agworld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onOpenPDFButton() {
        open(localBundleFile: "test_pdf", ext: "pdf")
    }

    @IBAction func openTxtButton() {
        open(localBundleFile: "test_txt", ext: "txt")
    }

    private func open(localBundleFile file: String, ext: String) {
        if let url = Bundle.url(forResource: file, withExtension: ext, subdirectory: nil, in: Bundle.main.bundleURL) {
            let documentInteractionController = UIDocumentInteractionController(url: url)
            documentInteractionController.delegate = self
            documentInteractionController.presentPreview(animated: true)
        }
    }

    // MARK: UIDocumentInteractionControllerDelegate
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}

