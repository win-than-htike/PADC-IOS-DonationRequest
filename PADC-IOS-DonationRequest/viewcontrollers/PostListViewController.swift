//
//  PostListViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Pyae Sone Tun on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import iOSDropDown
import ProgressHUD

class PostListViewController: UIViewController {

    @IBOutlet weak var locationList: DropDown!
    @IBOutlet weak var collectionViewPosts: UICollectionView!
    var postList : [PostVO] = []
    var typeList: [DonationTypesVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationList.optionArray = ["Yangon", "Mandalay"]
        ProgressHUD.show("Fetching News for You")
        
        self.collectionViewPosts.dataSource = self
        self.collectionViewPosts.delegate = self
        cellRegister()
        
        getPost()
        getDoantionTypes()
        
        locationList.didSelect { (selectedText, index, id) in
            self.getPostByRegionName(regionName: selectedText)
            print(selectedText)
        }
        
    }
    
    func cellRegister()  {
        CellRegisterUtil.cellRegister(nibName: "PostCollectionViewCell", collectionView: self.collectionViewPosts)
        
        CellRegisterUtil.cellRegister(nibName: "TypeListsCollectionViewCell", collectionView: self.collectionViewPosts)
    }
    
    func getPost() {
        DataModel.shared.getPosts(success: { (data) in
            self.postList.removeAll()
            self.postList.append(contentsOf: data)
            self.collectionViewPosts.reloadData()
            ProgressHUD.dismiss()
        }, failure:{
            ProgressHUD.dismiss()
        }
        )
    }
    
    func getDoantionTypes(){
        DataModel.shared.getTypes(success: { (data) in
            self.typeList.removeAll()
            self.typeList.append(contentsOf: data)
        }, failure: {})
    }
    
    func getPostByRegionName(regionName: String){
        DataModel.shared.getPostByRegionName(regionName: regionName, success: { (data) in
            self.postList.removeAll()
            self.postList.append(contentsOf: data)
            self.collectionViewPosts.reloadData()
            
            ProgressHUD.dismiss()
        }, failure: {
            ProgressHUD.dismiss()
        })
    }

}

extension PostListViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return postList.count
        }
        
        if section == 1 {
            return typeList.count
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
            let post = self.postList[indexPath.item]
            postCell.bindData(post)
            return postCell
        }else{
            
            let typesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeListsCollectionViewCell", for: indexPath) as! TypeListsCollectionViewCell
            
            typesCell.typeList = typeList
            return typesCell
        }
    }
}

extension PostListViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            let padding: CGFloat =  12
            let collectionViewSize = collectionView.frame.size.width - padding
            return CGSize(width: collectionViewSize, height: 160)
        }else{
            return CGSize(width: self.view.frame.width, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! PostDetailViewController
        let post = self.postList[indexPath.item]
       
        vc.post = post
        self.present(navigationController, animated: true, completion: nil)
    }
}
