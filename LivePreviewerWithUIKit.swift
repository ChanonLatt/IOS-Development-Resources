//
//  LivePreviewer.swift
//  Z1
//
//  Created by Chanon Latt on 12/5/21.
//  Copyright © 2021 Gaeasys. All rights reserved.
//

import Foundation

//MARK: - Just testing:
/*
 - it will provide a preview convas like SwiftUI project, but may work only running with simulator
 - to be more easier, add bottom code to your snippet and call it bottom of your view or view controller to build a previewer
 
 import SwiftUI
 @available(iOS 13.0.0, *)
 struct LivePreviewer: PreviewProvider {
     static var previews: some View {
         <#Preview any view or view controller by calling '.toSwiftUIView' eg: SBManager.getBuySellRentFindPropertyVC().toSwiftUIView#>
     }
 }
 
 */

import SwiftUI
@available(iOS 13.0.0, *)
extension UIViewController {
    
    private struct SwiftUIViewfromVC: UIViewControllerRepresentable {
        let viewControllerBuilder: () -> UIViewController
        init(_ vc: @escaping () -> UIViewController) { self.viewControllerBuilder = vc }
        func makeUIViewController(context: Context) -> UIViewController { viewControllerBuilder() }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    open var toSwiftUIView: some View {
        SwiftUIViewfromVC { self }
    }
}

@available(iOS 13.0.0, *)
extension UIView {
    
    private struct SwiftUIViewfromView: UIViewRepresentable {
        let viewBuilder: () -> UIView
        init(_ viewBuilder: @escaping () -> UIView) { self.viewBuilder = viewBuilder }
        func makeUIView(context: Context) -> some UIView { viewBuilder() }
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
    
    open var toSwiftUIView: some View {
        SwiftUIViewfromView { self }
    }
}
