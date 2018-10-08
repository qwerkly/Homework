//
//  ConversationsListViewController.swift
//  Homework
//
//  Created by Ivan Babich on 06/10/2018.
//  Copyright © 2018 Ivan Babich. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController {
    
    enum ConversationsParameters {
        case Name
        case Message
        case Date
        case Online
        case HasUnreadMessages
    }
    
    let sectionTitles = ["Online", "History"]
    var conversationData = [[[ConversationsParameters : Any]]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        var onlineParameters = [[ConversationsParameters : Any]]()
        let currentDate = Date()
        onlineParameters.append([.Name: "Anton Nosov", .Message: "Swift!!!", .Date: currentDate, .Online: true, .HasUnreadMessages: true])
        onlineParameters.append([.Name: "Anton Anosov", .Message: "Swift!!!", .Date: currentDate, .Online: true, .HasUnreadMessages: false])
        onlineParameters.append([.Name: "Ferry Corsten", .Message: "Swift!!!", .Date: currentDate, .Online: false, .HasUnreadMessages: false])
        onlineParameters.append([.Name: "LOL", .Message: "Swift!!!", .Date: currentDate, .Online: false, .HasUnreadMessages: true])
        for i in 0..<12 {
            let online = i % 2 == 0 ? true : false
            let hasUnread = i % 2 == 0 ? false : true
            let name = i % 2 == 0 ? "Vasiliy Pupkin" : "Ivan Babich"
            let timeInterval = Date().timeIntervalSince1970 - TimeInterval(86400 * i)
            let date = Date(timeIntervalSince1970: timeInterval)
            let message = i % 2 == 0 ? "" : "I love voleyball and swift la-la-la-la-la-la-la-la-la-la"
            onlineParameters.append([.Name: name, .Message: message, .Date: date, .Online: online, .HasUnreadMessages: hasUnread ])
        }
        conversationData.append(onlineParameters)
        conversationData.append([])
    }
    
    @IBAction func profileClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ProfileSegue", sender: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (conversationData[section].count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationTableViewCell
        cell.name = conversationData[indexPath.section][indexPath.row][ConversationsParameters.Name] as? String
        cell.message = conversationData[indexPath.section][indexPath.row][ConversationsParameters.Message] as? String
        cell.date = conversationData[indexPath.section][indexPath.row][ConversationsParameters.Date] as? Date
        cell.online = conversationData[indexPath.section][indexPath.row][ConversationsParameters.Online] as! Bool
        cell.hasUnreadMessages = conversationData[indexPath.section][indexPath.row][ConversationsParameters.HasUnreadMessages] as! Bool
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let name = conversationData[indexPath.section][indexPath.row][ConversationsParameters.Name]
        performSegue(withIdentifier: "ConversationSegue", sender: name)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConversationSegue" {
            if let vc = segue.destination as? ConversationViewController {
                vc.name = sender as? String
            }
        } else if segue.identifier == "ProfileSegue" {
            
        }
    }

}
