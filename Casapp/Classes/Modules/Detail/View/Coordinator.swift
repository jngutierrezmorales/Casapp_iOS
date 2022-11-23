//
//  Coordinator.swift
//  Casapp
//
//  Created by Juan Gutierrez on 23/11/22.
//

import Foundation
import MessageUI

class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    var parent: MailView
    
    init(_ parent: MailView) {
        self.parent = parent
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
