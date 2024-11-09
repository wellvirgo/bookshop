package vn.dangthehao.bookshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadFileService {
    private final ServletContext servletContext;

    public UploadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleUploadFile(MultipartFile file, String targetFolder) {
        if (file.isEmpty())
            return "not";
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalFileName = "";
        try {
            // convert multipartFile to bytes
            byte[] fileToBytes = file.getBytes();
            // create folder to save file
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists()) {
                dir.mkdir();
            }
            // create file to save
            finalFileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
            // save file into created file
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            bufferedOutputStream.write(fileToBytes);
            bufferedOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return finalFileName;
    }
}
