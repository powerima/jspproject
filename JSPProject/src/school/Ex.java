package school;


import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Ex {
	public static void main(String[] args) {
		SimpleDateFormat format = new SimpleDateFormat("YYYYMMdd");
		Timestamp register = new Timestamp(System.currentTimeMillis());
		String now = format.format(register);

		System.out.println(now);

	}
}
