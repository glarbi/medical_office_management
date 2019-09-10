package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class CONTENIR {
   String ID_ORD;
   String ID_MEC;
   String POSOLOGIE;
   CONTENIR (String ID_MEC,String ID_ORD,String POSOLOGIE){
	   this.ID_MEC = ID_MEC;
	   this.ID_ORD =ID_ORD;
	   this.POSOLOGIE =POSOLOGIE; 
	   }

}
