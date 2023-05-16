

import SwiftUI
import SCSDKCameraKit
import SCSDKCameraKitReferenceUI

struct ContentView: View {
    @State private var isPresenting = false
    var body: some View {
        Button(action: {
            isPresenting=true
        }){
            Text("start camera")
        }
        .sheet(isPresented: $isPresenting) {
                CustomViewControllerWrapper()
                }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
struct CustomViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = CameraViewController
    
    var state:Bool=true
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let session=SessionConfig(applicationID: "469231f3-aa68-4dc8-ba68-e989df71b1fe", apiToken: "eyJhbGciOiJIUzI1NiIsImtpZCI6IkNhbnZhc1MyU0hNQUNQcm9kIiwidHlwIjoiSldUIn0.eyJhdWQiOiJjYW52YXMtY2FudmFzYXBpIiwiaXNzIjoiY2FudmFzLXMyc3Rva2VuIiwibmJmIjoxNjgxNjUzNTY2LCJzdWIiOiI0NjkyMzFmMy1hYTY4LTRkYzgtYmE2OC1lOTg5ZGY3MWIxZmV-U1RBR0lOR35iODk3N2MzMi02NzkwLTRkOWYtOTUyMC1iMGU0Nzc1YmExNmQifQ.CLk2Utb8AtBb3Yuz_mqm_7bxqH4WOfTNR7PdP2PUYxQ")
        let cameraController = CustomizedCameraController(sessionConfig: session)
        cameraController.groupIDs=["dbaa7b30-415a-4ab3-ae2b-7e0fa1cb727f"]
        let vc=CameraViewController(cameraController: cameraController)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {

    }
}

class CustomizedCameraController:CameraController{
    override func configureLenses(
        orientation: AVCaptureVideoOrientation,
        textInputContextProvider: TextInputContextProvider?,
        agreementsPresentationContextProvider: AgreementsPresentationContextProvider?
    ) {
 
        let input = AVSessionInput(session: captureSession)
        let arInput = ARSessionInput()

        cameraKit.start(
            input: input,
            arInput: arInput,
            cameraPosition: .back,
            videoOrientation: orientation,
            dataProvider: configureDataProvider(),
            hintDelegate: self,
            textInputContextProvider: textInputContextProvider,
            agreementsPresentationContextProvider: agreementsPresentationContextProvider
        )
        DispatchQueue.global().async {

            input.startRunning()

        }
    }
}
