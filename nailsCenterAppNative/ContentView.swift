//
//  ContentView.swift
//  nailsCenterAppNative
//
//  Created by Gabriele Conte on 15/05/23.
//

import SwiftUI
import SCSDKCameraKit
import SCSDKCameraKitReferenceUI
import SCSDKCameraKitReferenceSwiftUI

struct ContentView: View {
    var body: some View {
        CameraView(cameraController: CameraController(sessionConfig: SessionConfig(applicationID: "469231f3-aa68-4dc8-ba68-e989df71b1fe", apiToken: "eyJhbGciOiJIUzI1NiIsImtpZCI6IkNhbnZhc1MyU0hNQUNQcm9kIiwidHlwIjoiSldUIn0.eyJhdWQiOiJjYW52YXMtY2FudmFzYXBpIiwiaXNzIjoiY2FudmFzLXMyc3Rva2VuIiwibmJmIjoxNjgxNjUzNTY2LCJzdWIiOiI0NjkyMzFmMy1hYTY4LTRkYzgtYmE2OC1lOTg5ZGY3MWIxZmV-U1RBR0lOR35iODk3N2MzMi02NzkwLTRkOWYtOTUyMC1iMGU0Nzc1YmExNmQifQ.CLk2Utb8AtBb3Yuz_mqm_7bxqH4WOfTNR7PdP2PUYxQ")) )
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
