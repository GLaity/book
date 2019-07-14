package test;

import com.book.dao.ICountAccountDao;
import com.book.dao.impl.CountAccountImpl;
import com.book.pojo.Count_Account;
import org.junit.jupiter.api.Test;

public class CountTest {
    @Test
    public void Text(){
        ICountAccountDao dao = new CountAccountImpl();
        Count_Account count_account = null;
        dao.updataTotalPay(2019,10.0);

    }
}
