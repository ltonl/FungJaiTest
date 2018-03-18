//
//  ShowTrackCollectionViewCell.swift
//  FungJaiTest
//
//  Created by tOn on 16/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ShowTrackCollectionViewCell: UICollectionViewCell {

    //IBOutlets
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNamelbl: UILabel!
    
    var trackData: JsonWithRealm? {
        didSet {
            DispatchQueue.main.async {
                if let trackImg = self.trackData?.cover {
                    if let url = URL(string: trackImg) {
                        self.trackImageView.af_setImage(withURL: url,
                                                   placeholderImage: UIImage(named: "fungjai-logo-player"),
                                                   filter: nil,
                                                   imageTransition: .crossDissolve(0.2),
                                                   runImageTransitionIfCached: true,
                                                   completion: nil)
                    }
                }
            }
            
            if let trackNametxt = trackData?.name {
                trackNamelbl.text = trackNametxt
            }
        }
    }
    
    //Override Function
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
