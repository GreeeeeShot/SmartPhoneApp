//
//  SpeechViewController.swift
//  WannaBeToilet
//
//  Created by ㅇ on 2017. 5. 26..
//  Copyright © 2017년 JUNEBUM KWEON. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController {

    @IBOutlet weak var StartSpeechButton: UIButton!
    @IBOutlet weak var StopSpeechButton: UIButton!
    
    @IBOutlet weak var TextView: UITextView!
    
    private let speechRecognizer = SFSpeechRecognizer()!
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @IBAction func StartSpeechAction(_ sender: Any) {
        StartSpeechButton.isEnabled = false
        StopSpeechButton.isEnabled = true
        try! startSession()
    }
    
    @IBAction func StopSpeechAction(_ sender: Any) {
        if audioEngine.isRunning{
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            StartSpeechButton.isEnabled = true
            StopSpeechButton.isEnabled = false
        }
    }
    func startSession() throws {
        
        if let recognitionTask = speechRecognitionTask {
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSessionCategoryRecord)
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = speechRecognitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed") }
        
        guard let inputNode = audioEngine.inputNode else { fatalError("Audio engine has no input node") }
        
        recognitionRequest.shouldReportPartialResults = true
        
        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            
            var finished = false
            
            if let result = result {
                self.TextView.text =
                    result.bestTranscription.formattedString
                finished = result.isFinal
            }
            
            if error != nil || finished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                self.StartSpeechButton.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            
            self.speechRecognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    func authorizeSR(){
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus{
                case .authorized:
                    self.StartSpeechButton.isEnabled = true
                    
                case .denied:
                    self.StartSpeechButton.isEnabled = false
                    self.StartSpeechButton.setTitle("Speech recognition access denied bu user", for: .disabled)
                    
                case .restricted:
                    self.StartSpeechButton.isEnabled = false
                    self.StartSpeechButton.setTitle("Speech recognition restricted on device", for: .disabled)
                    
                case .notDetermined:
                    self.StartSpeechButton.isEnabled = false
                    self.StartSpeechButton.setTitle("Speech recognition not authorized", for: .disabled)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorizeSR()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
