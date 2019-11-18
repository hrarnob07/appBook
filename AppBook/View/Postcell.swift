//
//  Postcell.swift
//  AppBook
//
//  Created by rtc hubs on 11/14/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class Postcell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePost(posts : Posts){
        
        titleText.text = posts.title
        bodyText.text = posts.body
    }

}
