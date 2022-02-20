//
//  ViewController.swift
//  RendaTest
//
//  Created by 溝手彩加 on 2022/02/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var haikei: UIView!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var mostBackground: UIView!
    
    var count = 0
    
    let sheeps: [String] = ["hitsuji_nohorn", "black_sheep", "hitsuji_horn"]
    
    var red: Float = 0
    var green: Float = 0
    var blue: Float = 0
    
    let sheepVoicePlayer = try! AVAudioPlayer(data: NSDataAsset(name: "hitsuji_voice")!.data)
    let ojiVoicePlayer = try! AVAudioPlayer(data: NSDataAsset(name: "oji_voice")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tapButton.layer.cornerRadius = 60
        countLabel.layer.cornerRadius = 50
        countLabel.clipsToBounds = true
    }
    
    @IBAction func tapTapButton(){
        count += 1
        countLabel.text = String(count)
        red = Float.random(in: 0...255)
        green = Float.random(in: 0...255)
        blue = Float.random(in: 0...255)
        countLabel.textColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        
        var image: UIImage
        
        if count % 10 == 0{
            image = UIImage(named: "jinmenken")!
            ojiVoicePlayer.currentTime = 0
            ojiVoicePlayer.play()
        }else{
            let sheepNum: Int = Int.random(in: 0..<3)
            image = UIImage(named: sheeps[sheepNum])!
            sheepVoicePlayer.currentTime = 0
            sheepVoicePlayer.play()
        }
        
        let imageView: UIImageView = UIImageView(image: image)
        let rect: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let viewWidth: CGFloat = view.frame.size.width
        let viewHeight: CGFloat = view.frame.size.height
        imageView.frame = rect
        imageView.center = CGPoint(x: CGFloat.random(in: 40...viewWidth-40), y: CGFloat.random(in: 60...viewHeight-40))
        haikei.addSubview(imageView)
    }

    @IBAction func reset(){
        count = 0
        countLabel.text = String(count)
        haikei.removeFromSuperview()
        let haikeiImage: UIImage = UIImage(named: "shibafu")!
        let imageView: UIImageView = UIImageView(image: haikeiImage)
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        mostBackground.addSubview(imageView)
        haikei = imageView
    }

}

