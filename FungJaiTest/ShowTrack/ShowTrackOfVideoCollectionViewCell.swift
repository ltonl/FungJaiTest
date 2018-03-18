//
//  ShowTrackOfVideoCollectionViewCell.swift
//  FungJaiTest
//
//  Created by tOn on 16/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import UIKit

class ShowTrackOfVideoCollectionViewCell: UICollectionViewCell {

    //IBOutlets
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoPlayerImage: UIImageView!
    
    var videoOrAdsData: JsonWithRealm? {
        didSet {
            DispatchQueue.main.async {
                if let imagedata = self.videoOrAdsData?.cover {
                    if let url = URL(string: imagedata) {
                        self.videoImage.af_setImage(withURL: url,
                                                    placeholderImage: UIImage(named: "fungjai-logo-player"),
                                                    filter: nil,
                                                    imageTransition: .crossDissolve(0.2),
                                                    runImageTransitionIfCached: true,
                                                    completion: nil)
                    }
                }
            }
            
            if let detectedType = videoOrAdsData?.type {
                if detectedType == "ads" {
                    videoPlayerImage.isHidden = true
                } else {
                    videoPlayerImage.isHidden = false
                }
            }
        }
    }
    
    //Override Function
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
