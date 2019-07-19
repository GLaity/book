package com.book.util;

import java.io.*;

public class UpdateUtils {
    public static void UpdateBook(String URL,String bookName,int chapterId) throws IOException {
        String chapter = getReadPath(chapterId);
        String newName = "../../book-manager/books/" + bookName + "/" + chapter;
        copyByte(URL,newName);

    }
    public static void UpdateBookPIC(String URL,int bookId){
        String newName = "../../book-manager/bookimg/" + bookId + ".jpg";
        copyByte(URL,newName);
    }
    public static void UpdateUserPIC(String URL,int UserId){
        String newName = "../../book-manager/userimg/" + UserId + ".jpg";
        copyByte(URL,newName);
    }
    private static String getReadPath(int ChapterId){
        String ChapterIdStr = null;
        if (0 <= ChapterId && 9>= ChapterId){
            ChapterIdStr = "000" + ChapterId + ".txt";
        }else if (10 <= ChapterId && 99>= ChapterId){
            ChapterIdStr =  "00" + ChapterId + ".txt";
        }else if (100 <= ChapterId && 999>= ChapterId){
            ChapterIdStr = "0" + ChapterId + ".txt";
        }else{
            ChapterIdStr = ChapterId + ".txt";
        }
        return ChapterIdStr;
    }
    private static void copyByte(String originalPath,String copyPath){
        //声明待复制文件
        File file = new File(originalPath);
        //声明复制目标文件
        File copyFile = new File(copyPath);
        FileInputStream fileInputStream = null;
        FileOutputStream fileOutputStream = null;
        try {
            //根据待复制文件  创建文件输入流
            fileInputStream = new FileInputStream(file);
            //声明复制目标文件输入流
            fileOutputStream = new FileOutputStream(copyFile);

            long fileSize = file.length();//获取待复制文件的大小

            byte buff[] = new byte[(int)fileSize];//存放文件内容的byte数组
            int len = 0;
            while((len = fileInputStream.read(buff)) != -1) {//读取文件内容到字节数组
                fileOutputStream.write(buff, 0, len);//写入字节数组到目标文件
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO: handle exception
        } finally {		//使用之后务必关闭流！
            try {
                if(fileInputStream != null) {
                    fileInputStream.close();
                }
                if(fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    private static void copyCharacter(String orignalPath,String copyPath) throws IOException {
        Reader reader = new InputStreamReader(new FileInputStream(new File(orignalPath)),"gbk");
        Writer writer = new OutputStreamWriter(new FileOutputStream(new File(copyPath)),"UTF-8");
        try {
            char[] buff = new char[1024];
            int len = 0;
            while((len = reader.read(buff)) != -1) {
                writer.write(buff,0,len);
            }
            writer.close();
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally {
            try {
                reader.close();
            }catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }finally {
                try {
                    writer.close();
                }catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            }
        }
    }
}
