//
//  FontViewModel.swift
//  Now
//
//  Created by Ale on 13/04/23.
//

import SwiftUI

class FontViewModel {
    
    static let shared = FontViewModel()
    
    let fontGentiumPlusTitle: Font
    let fontGentiumPlusTitle3: Font
    let fontGentiumPlusTitle4: Font
    let fontGentiumPlusTitle5: Font
    
    let fontGentiumPlusBody: Font
    
    let fontGentiumPlusBoldBody: Font
    
    let fontGentiumPlusItalicBody: Font
    
    init() {
        
        
        
        let fontURLRegular = Bundle.main.url(forResource: "Gentium Plus", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURLRegular! as CFURL, CTFontManagerScope.process, nil)
        
        let fontURLBold = Bundle.main.url(forResource: "Gentium Plus Bold", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURLBold! as CFURL, CTFontManagerScope.process, nil)
        
        let fontURLItalic = Bundle.main.url(forResource: "Gentium Plus Italic", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURLItalic! as CFURL, CTFontManagerScope.process, nil)
        
        
        let uifontGentiumPlusTitle = UIFont(name: "Gentium Plus", size: 100)!
        
        let uifontGentiumPlusTitle3 = UIFont(name: "Gentium Plus", size: 60)!
        
        let uifontGentiumPlusTitle4 = UIFont(name: "Gentium Plus", size: 35)!
        
        let uifontGentiumPlusTitle5 = UIFont(name: "Gentium Plus", size: 30)!
        
        
        
        let uifontGentiumPlusBody = UIFont(name: "Gentium Plus", size: 20)!
        
        let uifontGentiumPlusBoldBody = UIFont(name: "Gentium Plus Bold", size: 20)!
        
        let uifontGentiumPlusItalicBody = UIFont(name: "Gentium Plus Italic", size: 20)!
        
        
        
        fontGentiumPlusTitle = Font(uifontGentiumPlusTitle)
        fontGentiumPlusBody = Font(uifontGentiumPlusBody)
        fontGentiumPlusBoldBody = Font(uifontGentiumPlusBoldBody)
        fontGentiumPlusTitle3 =  Font(uifontGentiumPlusTitle3)
        
        fontGentiumPlusTitle4 =  Font(uifontGentiumPlusTitle4)
        
        fontGentiumPlusTitle5 =  Font(uifontGentiumPlusTitle5)
        
        fontGentiumPlusItalicBody =  Font(uifontGentiumPlusItalicBody)
        
        
    }
}
