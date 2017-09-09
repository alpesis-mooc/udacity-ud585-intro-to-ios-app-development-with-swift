//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by KellyChan on 7/9/2017.
//  Copyright © 2017 alpesis. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var audioRecorder: AVAudioRecorder
    
    @IBAction func recordAudio(_ sender: Any) {
        print("Record Button was pressed.")
        recordingLabel.text = "Recording in Progress"
        // stopRecording.isEnabled = true
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    @IBAction func stopRecording(_ sender: Any) {
        print("Stop recording was pressed.")
        // recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
    }
}

