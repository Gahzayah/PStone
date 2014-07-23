/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.persistence;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author MaHi
 */
public class FileHandler {

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
    HttpServletRequest request = null;
    List<FileItem> items = null;
    
    String fileName = null;
    String ContentType = null;
    long fileSize = 0;

    public FileHandler(HttpServletRequest req) throws FileUploadException {
        this.request = req;
        items = upload.parseRequest(request);
    }

    public String getParameter(String field_name) {
        String result = null;
        Iterator<FileItem> iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = iter.next();
            if (item.getFieldName().equals(field_name)) {
                result = item.getString();

            }
        }
        return result;
    }

    public InputStream getFile(String file_field) throws IOException {
        InputStream blob = null;
        Iterator<FileItem> iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = iter.next();
            if (item.getFieldName().equals(file_field)) {
                blob = item.getInputStream();
                setContentType(item.getContentType());
                setFileSize(item.getSize());
                setFileName(item.getName());
                
            }
        }
        return blob;
    }

    public String getContentType() {
        return ContentType;
    }

    public String getFileName() {
        return fileName;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setContentType(String ContentType) {
        this.ContentType = ContentType;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }
    
     

}
