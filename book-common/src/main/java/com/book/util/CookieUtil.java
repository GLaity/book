package com.book.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
    public static Cookie createCookie(String name,String value,int time,String path){
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(time);
        //设置有效范围
        cookie.setPath(path);//只能在CookieDemo02这个Servlet中获取该Cookie的信息
        return cookie;
    }
    public static String getCookieValue(HttpServletRequest request, String cookieName){
        Cookie[] cookies = request.getCookies();
        String value = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieName.equals(cookie.getName())) {
                    //确实是咱们要获取的那个名为username的cookie对象
                    value = cookie.getValue();
                }
            }
        }
        return value;
    }
}
