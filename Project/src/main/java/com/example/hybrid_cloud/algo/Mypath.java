/*
 * Mypath.java
 * Created on February 6, 2010, 10:30 PM
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.example.hybrid_cloud.algo;

import java.io.*;

public class Mypath {
    public static String setPath(String dir) {
        File directory = new File(dir);
        String path = null;
        if (directory.exists()) {
            path = "AbsolutePath";
        } else {
            try {
                System.out.println("Directory : " + dir);
                directory.mkdirs();
                path = "AbsolutePath";
            } catch (Exception e) {
                System.out.println("exception is :" + e);
            }
        }
        return path;
    }
}