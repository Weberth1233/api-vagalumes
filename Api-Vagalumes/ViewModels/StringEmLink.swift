//
//  StringEmLink.swift
//  Api-Vagalumes
//
//  Created by pat002902 on 07/06/22.
//

import Foundation

extension NSAttributedString {
    
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string);
        let substringrange = nsString.range(of: substring);
        let attributedString = NSMutableAttributedString(string: string);
        attributedString.addAttribute(.link, value: path, range: substringrange);
        return attributedString;
    }
}
