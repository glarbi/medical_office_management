package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

	
public class SOUFFRIR {
	
	String ID_MALADIE;
	String MAT_PAT;
		
		
		
		SOUFFRIR(String ID_MALADIE,String MAT_PAT)
		{
		   this.ID_MALADIE= ID_MALADIE;
	       this.MAT_PAT= MAT_PAT;
					
		}

}
