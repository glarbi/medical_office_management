package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class ORDONNANCE {
	String ID_ORD;
	String NOM_MED;
	String NOM_PAT;
		
		
		
		ORDONNANCE(String ID_ORD, String NOM_MED,String NOM_PAT)
		{
		   this.ID_ORD= ID_ORD;
	       this.NOM_MED= NOM_MED;
	       this.NOM_PAT= NOM_PAT;
					
		}
}
