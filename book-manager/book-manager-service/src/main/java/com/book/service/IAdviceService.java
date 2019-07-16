package com.book.service;

import com.book.pojo.Advice;
import com.book.pojo.Reply;

import java.util.List;

public interface IAdviceService {
    void addAdvice(Advice advice);
    void removeAdvice(int advice_Id);
    void modifyAdvice(Advice advice);
    Advice findAdviceById(int advice_Id);
    List<Advice> findAdviceAll();
    List<Advice> findAdviceByBook(int book_Id);
    List<Advice> findAdviceByUser(int user_Id);
    void addReply(Reply reply);
    void removeReply(int reply_Id);
    Reply findReplyById(int reply_id);
    List<Reply> findReplyByAdvice(int advice_Id);
}
