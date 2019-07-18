package test;

import com.book.dao.*;
import com.book.dao.impl.*;
import com.book.pojo.Book_Basic;
import com.book.pojo.Book_Contend;
import org.junit.Test;

import java.io.*;
import java.util.List;

public class WolfTest {
    @Test
    public void bookBasicTest(){
//        Book_Basic book = new Book_Basic();
////        book.setBook_Id(2);
//        book.setBook_Title("万古天帝X3!");
//        book.setBook_Context("0.0紫寰王朝，东极大陆一个疆域辽阔，武道、术法都颇为繁荣的人类国度。时则盛夏，烈日炎炎。");
//        book.setType_Id(2);
//        book.setWriter_Id("习风");
//        book.setBook_Createdate("2019.07.12");
//        IBookDao bookDao = new BookDaoImpl();
//        bookDao.insertBook(book);
////        bookDao.updateBook(book);
    }
    @Test
    public void bookSelectTest(){
        Book_Basic book = null;
        IBookDao bookDao = new BookDaoImpl();
        book = bookDao.selectBookById(1);
        System.out.println(book.getBook_Context());
        List<Book_Basic> books = null;
        books = bookDao.selectBookByType(2);
        System.out.println(books.get(1).getBook_Context());
    }

    @Test
    public void bookContendTest(){
//        Book_Contend contend = new Book_Contend(2,"D:\\Download\\万古天帝");
//        IBookContendDao bookContendDao = new BookContendDaoImpl();
////        bookContendDao.insertBookContend(contend);
////        bookContendDao.deleteBookContend(2);
//        Book_Contend contend2 = bookContendDao.findBookContend(1);
//        System.out.println(contend2.getBook_Id());
    }

    String path = "D:\\Download\\万古天帝\\";
    @Test
    public void bookDirBuild() throws IOException {

//        String writePath = path + "dir.txt";
//        File writeFile = new File(writePath);
//        if (!writeFile.exists()){
//            writeFile.createNewFile();
//        }
//
//        int count = 1;
////        String readPath = "";
////        FileWriter fw = new FileWriter(writeFile);
//        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(writeFile),"UTF-8"));
//        File readFile = new File(getReadPath(count));
//         do{
//            BufferedReader reader=new BufferedReader( new InputStreamReader(new FileInputStream(readFile),"gbk"));
////            FileReader fr = new FileReader(readFile);  //字符输入流
////            BufferedReader br = new BufferedReader(fr);  //使文件可按行读取并具有缓冲功能
////             String str = br.readLine();
//             String str = reader.readLine();
//             byte[] bytes = str.getBytes("UTF-8");
//             String outStr = new String(bytes);
////             fw.write(str + "\n");
//             writer.write(outStr + "\n");
////             writer.write(str.getBytes("UTF-8")+ "\n");
////             br.close();
//            count++;
//            readFile = new File(getReadPath(count));
//            reader.close();
//        }while(readFile.exists());
//         writer.flush();
//         writer.close();
//         fw.close();
//         writer.close();


//                StringBuffer strB = new StringBuffer();   //strB用来存储jsp.txt文件里的内容

//        while(str!=null){
////                    strB.append(str).append("<br>");   //将读取的内容放入strB
//            str = br.readLine();
//        }
//        br.close();    //关闭输入流
    }

    String getReadPath(int ChapterId){
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

    @Test
    public void TestGetBookDir() throws IOException {
//        IBookDirDao bookDirDao = new BookDirDaoImpl();
////        bookDirDao.setBookDir(1);
//        List<String> bookDir = bookDirDao.getBookDir(1);
//        if (bookDir == null){
//            System.out.println("null");
//        }
//        System.out.println("0" + bookDir.get(0));
//        System.out.println("1" + bookDir.get(1));
////        for (String str : bookDir){
////            System.out.println(str);
////        }
//        System.out.println(bookDir.size());

    }

    @Test
    public void testWriterDemo() throws IOException {
//        String readPath = "D:\\Download\\万古天\\UTF8.txt";
//        String copyPath = "D:\\Download\\万古天\\copy.txt";
        String readPath = null;
        String copyPath = null;
//        //输入流
//        BufferedReader reader=new BufferedReader(
//                new InputStreamReader(new FileInputStream(new File(readPath)),"gbk"));
//        //输出流
//        BufferedWriter writer=new BufferedWriter(
//                new OutputStreamWriter(new FileOutputStream(new File(copyPath)),"UTF-8"));
//        String string;
//        while((string=reader.readLine())!=null) {
//            byte[] str = string.getBytes("UTF-8");
//            String outStr = new String(str);
//            writer.write(outStr);
//        }
//        writer.flush();
//        writer.close();
//        reader.close();
    }

    @Test
    public void TestSplit(){
//        IBookContendDao bookContend = new BookContendDaoImpl();
//        Book_Contend book_contend = bookContend.findBookContend(1);
//        String path = book_contend.getBook_Contend();
//        String picturePath = path + "/picture.jpg";
////		String[] sa=filename.split("\\/");
//        String[] sa=path.split("\\\\");
//        String newname=sa[sa.length-1];
//        System.out.println(newname);        //获取小说名
//        System.out.println(picturePath);    //获取小说封面图片
    }
    @Test
    public void TestVip(){
//        IVipDao vipDao = new VipDaoImpl();
//        vipDao.deleteVipAccountId(2023);
        IBookExtendDao bookExtendDao = new BookExtendImpl();
        int chapters = bookExtendDao.findBookChapters(1);
        System.out.println(chapters);
    }


}
