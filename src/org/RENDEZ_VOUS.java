package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RENDEZ_VOUS {
	String NUM_RDV;
	String MAT_MED;
	String MAT_PAT;
	String DT_RDV;
	String ID_SER;
	RENDEZ_VOUS(String NUM_RDV,String MAT_MED,String MAT_PAT,String DT_RDV,String ID_SER)
	{
	 this.NUM_RDV=NUM_RDV;
	 this.MAT_MED=MAT_MED;
	 this.MAT_PAT=MAT_PAT;
	 this.DT_RDV=DT_RDV;
	 this.ID_SER=ID_SER;
	}

}
