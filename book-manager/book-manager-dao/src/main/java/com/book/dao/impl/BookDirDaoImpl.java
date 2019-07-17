package com.book.dao.impl;

import com.book.dao.IBookContendDao;
import com.book.dao.IBookDirDao;
import com.book.pojo.Book_Contend;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class BookDirDaoImpl implements IBookDirDao {

    @Override
    public List<String> getBookDir(int BookId) {
        // String path = "D:\\Download\\万古天帝\\" + "dir.txt";
// String path  = "D:\\Download\\万古天帝\\dir.txt";
        String path = readTargetBook(BookId) + "/dir.txt";
        List<String> bookDir =  new ArrayList<>();
        String dir = null;
        BufferedReader reader= null;

        try {
            reader = new BufferedReader( new InputStreamReader(new FileInputStream(new File(path)),"UTF-8"));
            do{
                dir = reader.readLine();
                if(dir == null){
                    continue;
                }
                bookDir.add(dir);

            //   bookDir.add(reader.readLine());
            }while (dir != null);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return bookDir;
    }

    @Override
    public void setBookDir(int BookId) throws IOException {
        String path = readTargetBook(BookId) + "/";
//        String path = "D:\\Download\\万古天" + "\\";
        String writePath = path + "dir.txt";
        File writeFile = new File(writePath);
        if (!writeFile.exists()){
            writeFile.createNewFile();
        }

        int count = 1;
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(writeFile),"UTF-8"));
        File readFile = new File(getReadPath(path,count));
        do{
            BufferedReader reader=new BufferedReader( new InputStreamReader(new FileInputStream(readFile),"gbk"));
            String str = reader.readLine();
            byte[] bytes = str.getBytes("UTF-8");
            String outStr = new String(bytes);
            writer.write(outStr + "\n");
            count++;
            readFile = new File(getReadPath(path,count));
            reader.close();
        }while(readFile.exists());
        writer.flush();
        writer.close();
    }

    @Override
    public void updateBookDir(int BookId) {

    }

    private String readTargetBook(int BookId) {
        IBookContendDao bookContendDao = new BookContendDaoImpl();
        Book_Contend book = null;
        book = bookContendDao.findBookContend(BookId);
        String path = book.getBook_Contend();
        return path;
    }
    private String getReadPath(String path, int ChapterId){
        String ChapterIdStr = null;
        if (0 <= ChapterId && 9>= ChapterId){
            ChapterIdStr = path + "000" + ChapterId + ".txt";
        }else if (10 <= ChapterId && 99>= ChapterId){
            ChapterIdStr =  path + "00" + ChapterId + ".txt";
        }else if (100 <= ChapterId && 999>= ChapterId){
            ChapterIdStr = path +  "0" + ChapterId + ".txt";
        }else{
            ChapterIdStr = path + ChapterId + ".txt";
        }
        return ChapterIdStr;
    }
}
