import UIKit

class SymbolRollerViewController: UIViewController {

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To-Do:
        // 심볼에서 하나를 임의로 추출해서
        // 이미지와 텍스트를 설정한다
        print(reload(), "로 생성")
        //button 생성시 색깔 변경
        btn.tintColor = UIColor.systemPink
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @IBAction func btnTap(_ sender: Any) {
        
        print(reload(),"바꿈")

        
        // 이미지와 텍스트를 설정한다
    }
    func reload() -> String {
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
        
        return symbol
    }
    

}
