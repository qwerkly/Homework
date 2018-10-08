//
//  ConversationViewController.swift
//  Homework
//
//  Created by Ivan Babich on 07/10/2018.
//  Copyright © 2018 Ivan Babich. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var chatTableView: UITableView!
    
    enum MessageType {
        case Transmitted
        case Received
    }
    
    struct MessageParameters {
        var type: MessageType
        var text: String?
    }
    
    var name: String?
    private let messages = [
        MessageParameters(type: .Transmitted, text: "Hello"),
        MessageParameters(type: .Received, text: "Hello!"),
        MessageParameters(type: .Transmitted, text: "How are you?"),
        MessageParameters(type: .Received, text: "I'm fine, thank you! And you?"),
        MessageParameters(type: .Transmitted, text: "I'm fine, thank you! I bought a new bike! :)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))"),
        MessageParameters(type: .Transmitted, text: "It's BMW."),
        MessageParameters(type: .Received, text: "Нафиг ты мне пишешь на английском?!"),
        MessageParameters(type: .Transmitted, text: ":)")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chatTableView.estimatedRowHeight = 100
        chatTableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].type == .Transmitted {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransmittingMessageCell", for: indexPath) as! TransmittingMessageTableViewCell
            cell.messageTextView.text = messages[indexPath.row].text
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceivingMessageCell", for: indexPath) as! ReceivingMessageTableViewCell
            cell.messageTextView.text = messages[indexPath.row].text
            return cell
        }
    }

}
