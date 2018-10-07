//
//  ConversationTableViewCell.swift
//  Homework
//
//  Created by Ivan Babich on 06/10/2018.
//  Copyright © 2018 Ivan Babich. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell, ConversationCellConfiguration {
    
    var name: String? {
        set {
            self.nameLabel.text = newValue
        } get {
            return self.nameLabel.text
        }
    }
    
    var message: String? {
        set {
            if newValue == nil || newValue == "" {
                self.messageLabel.text = "No messages yet"
//                self.messageLabel.font = UIFont(name: "System Italic", size: 12)
            } else {
                self.messageLabel.text = newValue
//                self.messageLabel.font = UIFont(name: "System", size: 40)
            }
        } get {
            return self.messageLabel.text == "No messages yet" ? nil : self.messageLabel.text
        }
    }
    
    var date: Date? {
        set {
            if let newValue = newValue {
                let currentTimeStamp = UInt(Date().timeIntervalSince1970 / (60 * 60 * 24))
                let timeStamp = UInt(newValue.timeIntervalSince1970 / (60 * 60 * 24))
                let dateFormatter = DateFormatter()
                if (timeStamp < currentTimeStamp) {
                    dateFormatter.dateFormat = "dd MMM"
                    self.dateLabel.text = dateFormatter.string(from: newValue)
                } else {
                    dateFormatter.dateFormat = "HH:mm"
                    self.dateLabel.text = dateFormatter.string(from: newValue)
                }
            } else {
                self.dateLabel.text = ""
            }
        } get {
            if self.dateLabel.text != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                return dateFormatter.date(from: self.dateLabel.text!)
            } else {
                return nil
            }
        }
    }
    
    var online: Bool {
        set {
            if (newValue) {
                self.backgroundColor = UIColor.yellow
            } else {
                self.backgroundColor = UIColor.white
            }
        } get {
            return self.backgroundColor == UIColor.white ? false : true
        }
    }
    
    var hasUnreadMessages: Bool {
        set {
            if newValue {
                self.messageLabel.font = UIFont(name: "System-Semibold", size: 12)
            } else {
                self.messageLabel.font = UIFont(name: "System-Light", size: 12)
            }
        } get {
            if (self.messageLabel.font == UIFont(name: "System-Semibold", size: 12)) {
                return true
            } else {
                return false
            }
        }
    }
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
}

protocol ConversationCellConfiguration {
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}
