<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String ls_sql1=null;

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String lsfwmj=null;
double fwmj=0;
double pmjj=0;
String lsqye=null;
double qye=0;
String lssjkgrq=null;
java.sql.Date qyrq=null;
java.sql.Date sjkgrq=null;
String lssjjgrq=null;
java.sql.Date sjjgrq=null;
String lsbxjzsj=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;
String zjxm=null;
String lssgd=null;
String sgd=null;
String sjs=null;
String lsysbm=null;
String ysbm=null;
String dwbh=null;
String pdclzt=null;
String gcjdbm=null;
String kbxbz=null;

//String dqbm="02";
String ssfgs="FCD00";

int count=0;
int start=20705;
int pos=0;

String khbh=null;
String ls=null;

try {

	//得到ORACLE连接
	conn=cf.getConnection();    
	
	conn.setAutoCommit(false);

	//中级报价
	ls_sql1 ="select hth,khxm,fwdz,lxfs,fwmj,qye,sjkgrq,sjjgrq,bxjzsj,zjxm,sgd,sjs,ysbm,dwbh ";
	ls_sql1+=" from imp_khxx  ";
	ls_sql1+=" order by dwbh,hth ";
//	out.println(ls_sql1);
	ps1= conn.prepareStatement(ls_sql1);
	rs1=ps1.executeQuery();
	while(rs1.next())
	{
		count++;

		hth=rs1.getString("hth");
		khxm=rs1.getString("khxm");
		fwdz=rs1.getString("fwdz");
		lxfs=rs1.getString("lxfs");
		lsfwmj=cf.fillNull(rs1.getString("fwmj"));
		lsqye=cf.fillNull(rs1.getString("qye"));
		lssjkgrq=cf.fillNull(rs1.getString("sjkgrq"));
		lssjjgrq=cf.fillNull(rs1.getString("sjjgrq"));
		lsbxjzsj=cf.fillNull(rs1.getString("bxjzsj"));
		zjxm=rs1.getString("zjxm");
		lssgd=cf.fillNull(rs1.getString("sgd"));
		sjs=rs1.getString("sjs");
		lsysbm=rs1.getString("ysbm");
		dwbh=rs1.getString("dwbh");

//		out.println("<BR>dwbh="+dwbh+";hth="+hth);

		bxkssj=null;
		bxjzsj=null;

		try{
			if (lsqye.equals("") || lsqye.equals("0"))
			{
				qye=0;
			}
			else{
				qye=Double.parseDouble(lsqye);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[签约额]类型转换发生意外:"+lsqye);
			return;
		}

		try{
			if (lsfwmj.equals("") || lsfwmj.equals("0"))
			{
				fwmj=0;
				pmjj=0;
			}
			else{
				fwmj=Double.parseDouble(lsfwmj);
				pmjj=qye/fwmj;
				if (pmjj>50000)
				{
					out.println("<BR>[房屋面积]类型转换发生意外:"+pmjj);
				}
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[房屋面积]类型转换发生意外:"+lsfwmj);
			return;
		}

		try{
			if (lssjkgrq.equals(""))
			{
				sjkgrq=null;
			}
			else{
				pos=lssjkgrq.indexOf(".");
				lssjkgrq="2005-"+lssjkgrq.substring(0,pos)+"-"+lssjkgrq.substring(pos+1);
				sjkgrq=java.sql.Date.valueOf(lssjkgrq);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[实际开工日期]类型转换发生意外:"+lssjkgrq);
			return;
		}

		try{
			if (lssjjgrq.equals(""))
			{
				sjjgrq=null;
			}
			else{
				pos=lssjjgrq.indexOf(".");
				lssjjgrq="2005-"+lssjjgrq.substring(0,pos)+"-"+lssjjgrq.substring(pos+1);
				sjjgrq=java.sql.Date.valueOf(lssjjgrq);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[实际竣工日期]类型转换发生意外:"+lssjjgrq);
			return;
		}

		try{
			if (lsbxjzsj.equals(""))
			{
				bxkssj=null;
				bxjzsj=null;
			}
			else{
				pos=lsbxjzsj.indexOf(".");
				ls="20"+lsbxjzsj.substring(0,pos);
				lsbxjzsj=lsbxjzsj.substring(pos+1);

				pos=lsbxjzsj.indexOf(".");
				lsbxjzsj=ls+"-"+lsbxjzsj.substring(0,pos)+"-"+lsbxjzsj.substring(pos+1);

				bxkssj=sjjgrq;
				bxjzsj=java.sql.Date.valueOf(lsbxjzsj);
			}
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>[保修截止时间]类型转换发生意外:"+lsbxjzsj);
			return;
		}



		qyrq=sjkgrq;

		if (!lssjjgrq.equals(""))
		{
			gcjdbm="5";
		}
		else if (!lssjkgrq.equals(""))
		{
			gcjdbm="2";
		}
		else{
			gcjdbm="1";
		}

		if (!lsbxjzsj.equals(""))
		{
			kbxbz="Y";
		}
		else{
			kbxbz="0";
		}
		

		if (!lssgd.equals(""))
		{
			pdclzt="4";

			lssgd=lssgd.trim();

			ls_sql1 ="select dwbh";
			ls_sql1+=" from sq_dwxx ";
			ls_sql1+=" where dwmc='"+lssgd+"' and ssfgs='"+ssfgs+"'";
			ps= conn.prepareStatement(ls_sql1);
			rs=ps.executeQuery();
			if(rs.next())
			{
				sgd=rs.getString("dwbh");
			}
			else{
				sgd=null;
				out.println("<BR>错误！施工队不存在:"+lssgd);
			}
			rs.close();
			ps.close();
		}
		else{
			pdclzt="1";
			sgd=null;
		}
		if (sgd==null)
		{
			if (!gcjdbm.equals("1"))
			{
				pdclzt="4";
			}
		}

		ls_sql1 ="select ysbm";
		ls_sql1+=" from dm_ysbm ";
		ls_sql1+=" where ysmc='"+lsysbm+"'";
		ps= conn.prepareStatement(ls_sql1);
		rs=ps.executeQuery();
		if(rs.next())
		{
			ysbm=rs.getString("ysbm");
		}
		rs.close();
		ps.close();


/*
		if (jldwbmmc!=null && jldwbm==null)
		{
			out.println("asda");
		}
*/
		
		khbh=cf.addZero(count+start,7);

		ls_sql="insert into crm_khxx ( khbh,khxm,fwdz,lxfs,ysbm,hth,sjs,zjxm,sgd,qye,fwmj,pmjj,qyrq,sjkgrq,sjjgrq,kbxbz,bxkssj,bxjzsj,dwbh,lrsj,lrr   ,zt,tsbz,pdclzt,ybjbz,gcjdbm,sfxhf,kpbz,bxbz,hfdjbz  ,czkbz,jsjd,gdjsjd,htshbz,dalqbz,sffj,sfyrz,hdbz,KHLXBM) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),'erp'      ,'2','N',?,'N',?,'N','Y','N','0'  ,'0','3','3','Y','3','N','N','1','04') ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,khxm);
		ps.setString(3,fwdz);
		ps.setString(4,lxfs);
		ps.setString(5,ysbm);
		ps.setString(6,hth);
		ps.setString(7,sjs);
		ps.setString(8,zjxm);
		ps.setString(9,sgd);
		ps.setDouble(10,qye);
		ps.setDouble(11,fwmj);
		ps.setDouble(12,pmjj);
		ps.setDate(13,qyrq);
		ps.setDate(14,sjkgrq);
		ps.setDate(15,sjjgrq);
		ps.setString(16,kbxbz);
		ps.setDate(17,bxkssj);
		ps.setDate(18,bxjzsj);
		ps.setString(19,dwbh);


		ps.setString(20,pdclzt);
		ps.setString(21,gcjdbm);
		
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();

	
	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+count);
}
catch (Exception e) {
	conn.rollback();
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
