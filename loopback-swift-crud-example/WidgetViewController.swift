//
//  WidgetViewController.swift
//  loopback-swift-crud-example
//
//  Created by Kevin Goedecke on 12/23/15.
//  Copyright © 2015 kevingoedecke. All rights reserved.
//

import UIKit

class WidgetViewController: UIViewController   {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberValueSlider: UISlider!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var widget: Widget?
    lazy var repositoryController = LBRepositoryController(repositoryType: WidgetRepository.self)
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            if let existingWidget = widget {
                existingWidget.name = nameTextField.text ?? ""
                existingWidget.bars = Int(numberValueSlider.value)
                repositoryController.updateModel(existingWidget)
            }
            else    {
                let name = nameTextField.text ?? ""
                let numberValue = numberValueSlider.value
                if (name != "") {
                    repositoryController.createModel(
                        [
                            "name": name,
                            "bars": Int(numberValue)
                        ], success:  {newWidget in
                            NSLog("Successfully created")
                            self.widget = newWidget as? Widget
                        }
                    )
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let widget = widget  {
            nameTextField.text = widget.name
            numberValueSlider.value = widget.bars as Float
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
