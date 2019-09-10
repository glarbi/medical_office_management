package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class EXAMEN {
	String NUM_EXM;
	String MAT_MED;
	String MAT_PAT;
	String NOM_EXM;
	String DT_EXM;
	String RES_EXM;
	String ID_SER;
	EXAMEN (String NUM_EXM, String MAT_MED,String MAT_PAT,String NOM_EXM,String DT_EXM,String RST_EXM,String ID_SER)
	{
     this.NUM_EXM=NUM_EXM;
     this.MAT_MED=MAT_MED;
     this.MAT_PAT=MAT_PAT;
     this.NOM_EXM=NOM_EXM;
     this.DT_EXM=DT_EXM;
     this.RES_EXM=RES_EXM;
     this.ID_SER=ID_SER;
	}
}
