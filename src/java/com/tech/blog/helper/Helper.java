/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Rishabh Srivastava
 */
public class Helper {
    
    public static boolean deleteFile(String path){
        boolean f = false;
        
        try {
           
            File file = new File(path);
            f = file.delete();
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return f;
    }
    
    public static boolean saveFile(InputStream is,String path){
        
        boolean f = false;
        
        try {
//            To read data
            byte b[] = new byte[is.available()];
            is.read(b);
            
//            To write data
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            
            f =true;      
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return f;
    }
}
