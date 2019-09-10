package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class MALADIE {

	String ID_MALADIE;
	String NOM_MALADIE;

	
	
	MALADIE(String ID_MALADIE, String NOM_MALADIE)
	{
		this.ID_MALADIE = ID_MALADIE;
		this.NOM_MALADIE = NOM_MALADIE;
				
	}
}
