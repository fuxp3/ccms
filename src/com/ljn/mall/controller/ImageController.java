package com.ljn.mall.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ImageController {
	
	@ResponseBody
	@GetMapping("/image/products/{name:.+}")
    public void readProductsImage(@PathVariable("name") String name, HttpServletResponse response){
		System.out.println(name);
        String destFileName = "";
        InputStream fis = null;
        try {
            //上传文件存储的位置
            destFileName = "D:\\File\\images\\products" + File.separator + name;
            //防止改文件夹不存在，创建一个新文件夹
            File destFile = new File(destFileName);

            fis = new FileInputStream(destFile);

            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(name, "UTF-8"));
            ServletOutputStream outputStream = response.getOutputStream();

            IOUtils.copy(fis,outputStream);

        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
	
	@ResponseBody
	@GetMapping("/image/userPhoto/{name:.+}")
    public void readUserPhotoImage(@PathVariable("name") String name, HttpServletResponse response){
		System.out.println(name);
        String destFileName = "";
        InputStream fis = null;
        try {
            //上传文件存储的位置
            destFileName = "D:\\File\\images\\userPhoto" + File.separator + name;
            //防止改文件夹不存在，创建一个新文件夹
            File destFile = new File(destFileName);

            fis = new FileInputStream(destFile);

            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(name, "UTF-8"));
            ServletOutputStream outputStream = response.getOutputStream();

            IOUtils.copy(fis,outputStream);

        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
