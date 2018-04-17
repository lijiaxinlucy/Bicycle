package dbutils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBConnection {
	private DBConnection(){}

	static SessionFactory factory=null;
	static {
		Configuration cfg=new Configuration();
        cfg.configure("hibernate.cfg.xml");  
        factory=cfg.buildSessionFactory();
        
        System.out.println("init hibernate sucess!!!");
	}
	
	public static SessionFactory getFactory(){
		return factory;
	}
}
