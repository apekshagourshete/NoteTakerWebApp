package com.helper;

import java.sql.SQLException;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory() throws SQLException
	{   
		if(factory==null)
		{
			
			factory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	
	public void closeFactory()
	{
		if (factory.isOpen());
		{
			factory.close();
		}
	}

}
