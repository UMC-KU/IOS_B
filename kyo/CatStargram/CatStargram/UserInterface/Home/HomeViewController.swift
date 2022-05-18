//
//  HomeViewController.swift
//  CatStargram
//
//  Created by 황유란 on 2022/04/09.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var arrayCat:[FeedModel]=[]
    let imagePickerViewController=UIImagePickerController() //카메라 뷰컨트롤러
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        tableView.separatorStyle = .none //구분선 없애기
        
        //테이블뷰에 셀을 등록해줌
        let feedNib=UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        
        let storyNib=UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier : "StoryTableViewCell")
        // Do any additional setup after loading the view.
        
        let input=FeedAPIInput(limit:10, page:0)
        FeedDataManager().feedDataManager(input,self)
        
        imagePickerViewController.delegate=self
    }
    @IBAction func buttonGoAlbum(_ sender: Any) {
        self.imagePickerViewController.sourceType = .photoLibrary
        self.present(imagePickerViewController,animated: true,completion: nil)
    }
    

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCat.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row==0){
            guard let cell=tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
            else{
                return UITableViewCell()
            }
            return cell
        }
        else{
            guard let cell=tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            
            if let urlString=arrayCat[indexPath.row-1].url{
                let url=URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
           
            cell.selectionStyle = .none //선택될 때 어두워지는거 없애기
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row==0){
            return 80
        }
        else{
            return 600
        }
        
    }
    

    //셀이 보여졌을 때 이미 델리게이트 설정이 완료되었으면 하기 때문에 willDisplay에다가 구현
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell=cell as? StoryTableViewCell else{ //StroyTableViewCell 차례냐? 그럼 통과
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    

    
}
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:50,height:60)
    }
        
}

//서버연동
extension HomeViewController{
    func successAPI(_ result: [FeedModel]){
        arrayCat=result
        tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            let imageString="https://firebasestorage.googleapis.com/v0/b/catstargram-d7fbf.appspot.com/o/Cat1?alt=media&token=e92d1af6-ceb3-4a0c-9ba9-acd5cf534a42"
            let input=FeeduploadInput(content: "저의 상이입니다. 귀엽지 않나요?", postImgsUrl: [imageString])
            FeedUploadDataManager().post(self,input)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
