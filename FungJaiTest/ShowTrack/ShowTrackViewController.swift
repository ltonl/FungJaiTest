//
//  ShowTrackViewController.swift
//  FungJaiTest
//
//  Created by tOn on 16/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import UIKit
import RealmSwift
import MBProgressHUD

class ShowTrackViewController: UIViewController {

    //IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    var realm: Realm!
    var HUD = MBProgressHUD()
    
    var reamlData: Results<JsonWithRealm> {
        get {
            return realm.objects(JsonWithRealm.self).sorted(byKeyPath: "id", ascending: true)
        }
    }
    
    let trackCellId = "trackCellId"
    let videoCellId = "videoCellId"
    
    //Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        callJson()
        
        collectionView.register(UINib(nibName: "ShowTrackCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: trackCellId)
        collectionView.register(UINib(nibName: "ShowTrackOfVideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: videoCellId)
    }
    
    //Fileprivate Function
    fileprivate func callJson() {
        HUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        HUD.detailsLabel.text = "Now Loading"
        APIManager.shareInstance.jsonRequest(callback: self.callbackJsonData)
    }
}

//Extension UICollectionView Of ShowTrackViewController
extension ShowTrackViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reamlData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch reamlData[indexPath.item].type {
        case "video"?:
            return CGSize(width: collectionView.frame.width/1.25, height: collectionView.frame.height/3)
        default:
            return CGSize(width: collectionView.frame.width/1.25, height: collectionView.frame.height/5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if reamlData[indexPath.item].type == "video" || reamlData[indexPath.item].type == "ads" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoCellId, for: indexPath) as! ShowTrackOfVideoCollectionViewCell
            
            cell.videoOrAdsData = reamlData[indexPath.item]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trackCellId, for: indexPath) as! ShowTrackCollectionViewCell
            
            cell.trackData = reamlData[indexPath.item]
            
            return cell
        }
    }
}
