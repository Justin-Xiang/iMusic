//
//  SupportFile.swift
//  iMusic
//
//  Created by JustinXiang on 2021/01/17.
//  Copyright © 2021 JustinXiang. All rights reserved.
//
import UIKit

let info = ["播放列表", "艺人", "专辑", "歌曲"]
let songs: Array<(SongName: String, Artist: String)> = [("Galway Girl", "Ed Sheeran"), ("Photograph", "Ed Sheeran"), ("YELLOW", "神山羊"), ("烟袋斜街", "接个吻, 开一枪")]

struct Current {
    static var index: Int?
    static var songName: String! {
        get
        {
            if index == nil
            {
                return "未在播放"
            }
            return songs[index!].SongName
        }
    }
    static var artist: String! {
        get
        {
            if index == nil
            {
                return ""
            }
            return songs[index!].Artist
        }
    }
}

extension UIImage {
    func generateNewImage(scaledToSize newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
