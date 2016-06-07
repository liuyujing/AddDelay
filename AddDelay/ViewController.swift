//
//  ViewController.swift
//  AddDelay
//
//  Created by Bruce on 16/6/7.
//  Copyright © 2016年 Bruce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var engine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let intput = engine.inputNode!
        let output = engine.outputNode
        
//        创建设置延迟
        let dalay = AVAudioUnitDelay()
//        延迟时间的范围是0-2秒 默认值是1
        dalay.delayTime = 0.5
//        延迟的反馈值范围-100到100 默认值50 直接影响到咱们回音的时长
        dalay.feedback = 20
        dalay.wetDryMix = 80
        
//        将distortion附着到 音频引擎
        engine.attachNode(dalay)
        
//        开始连接各个节点
        engine.connect(intput, to: dalay, format: intput.inputFormatForBus(0))
        engine.connect(dalay, to: output, format: intput.inputFormatForBus(0))
        
//        开启引擎
        try! engine.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

