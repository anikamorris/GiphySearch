//
//  GifCell.swift
//  GiphySearchIOS
//
//  Created by Anika Morris on 6/7/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class GifCell: UITableViewCell {
    /// Gif to be displayed.
    var gif: Gif?
    /// ImageView to contain our gif.
    var gifView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Make sure cell has a gif object
        if gif != nil {
            // Grab gif from gif object and display it inside the imageview
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            addSubview(gifView)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
