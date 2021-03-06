<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] drxh =request.getParameterValues("row");
String[] khxm =request.getParameterValues("khxm");
String[] hth =request.getParameterValues("hth");
String[] lxfs =request.getParameterValues("lxfs");
String[] qtdh =request.getParameterValues("qtdh");
String[] fwdz =request.getParameterValues("fwdz");
String[] khjl =request.getParameterValues("khjl");
String[] sjs =request.getParameterValues("sjs");
String[] zjxm =request.getParameterValues("zjxm");
String[] sgd =request.getParameterValues("sgd");
String[] sgdxm =request.getParameterValues("sgdxm");
String[] sgbz =request.getParameterValues("sgbz");
String[] mgfrz =request.getParameterValues("mgfrz");
String[] nwgfrz =request.getParameterValues("nwgfrz");
String[] sdgfrz =request.getParameterValues("sdgfrz");
String[] yqgfrz =request.getParameterValues("yqgfrz");
String[] wdzgcestr =request.getParameterValues("wdzgce");
String[] qyestr =request.getParameterValues("qye");
String[] qyrqstr =request.getParameterValues("qyrq");
String[] kgrqstr =request.getParameterValues("kgrq");
String[] jgrqstr =request.getParameterValues("jgrq");
String[] xxlybm =request.getParameterValues("xxlybm");
String[] xxlysm =request.getParameterValues("xxlysm");
String[] dwbh =request.getParameterValues("dwbh");
String[] fgsbh =request.getParameterValues("fgsbh");
String[] gcjdbm =request.getParameterValues("gcjdbm");
String[] bz =request.getParameterValues("bz");


String[] khlxbm =request.getParameterValues("khlxbm");
String[] hxbm =request.getParameterValues("hxbm");
String[] ysbm =request.getParameterValues("ysbm");
String[] fwmjstr =request.getParameterValues("fwmj");
String[] sfyyh =request.getParameterValues("sfyyh");
String[] yhyy =request.getParameterValues("yhyy");

String[] sjkgrqstr =request.getParameterValues("sjkgrq");
String[] sjjgrqstr =request.getParameterValues("sjjgrq");
String[] bxjzsjstr =request.getParameterValues("bxjzsj");
String[] kbxbz =request.getParameterValues("kbxbz");

int fwmj=0;
java.sql.Date sjkgrq=null;
java.sql.Date sjjgrq=null;
java.sql.Date bxjzsj=null;


double wdzgce=0;
double qye=0;
java.sql.Date qyrq=null;
java.sql.Date kgrq=null;
java.sql.Date jgrq=null;

  
//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接

	String khbh="";
	 
	conn.setAutoCommit(false);

	int i=0;
	for (i=0;i<khxm.length ;i++ )
	{
		int count=0;
		ls_sql=" select count(*)" ;
		ls_sql+=" from crm_khxx " ;
		ls_sql+=" where  hth='"+hth[i]+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		if (count>0)
		{
			conn.rollback();
			out.println("序号『"+drxh[i]+"』错误！合同号『"+hth[i]+"』已存在");
			return;
		}
		


		//生成『客户编号』＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		int xh=0;
		ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
		ls_sql+=" from  crm_zxkhxx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		//检查『客户编号』在crm_khxx中是否存在
		while (true)
		{
			khbh=cf.addZero(xh,7);

			ls_sql="select count(*)";
			ls_sql+=" from  crm_khxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			if (count>0)
			{
				xh++;
			}
			else{
				break;
			}
		}
		//生成『客户编号』＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

		//检查『工程原报价』是否正确
		if (wdzgcestr[i]==null || wdzgcestr[i].equals(""))
		{
			wdzgce=0;
		}
		else{
			try{
				wdzgce=Double.parseDouble(wdzgcestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！工程原报价『"+wdzgcestr[i]+"』不是数字类型！");
				return;
			}
		}

		//检查『工程签约额』是否正确
		if (qyestr[i]==null || qyestr[i].equals(""))
		{
			qye=0;
		}
		else{
			try{
				qye=Double.parseDouble(qyestr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！工程签约额『"+qyestr[i]+"』不是数字类型！");
				return;
			}
		}

		//检查『签约日期』是否正确
		if (qyrqstr[i]==null || qyrqstr[i].equals(""))
		{
			qyrq=null;
		}
		else{
			try{
				qyrq=java.sql.Date.valueOf(qyrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！签约日期『"+qyrqstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『合同开工日期』是否正确
		if (kgrqstr[i]==null || kgrqstr[i].equals(""))
		{
			kgrq=null;
		}
		else{
			try{
				kgrq=java.sql.Date.valueOf(kgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！合同开工日期『"+kgrqstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『合同竣工日期』是否正确
		if (jgrqstr[i]==null || jgrqstr[i].equals(""))
		{
			jgrq=null;
		}
		else{
			try{
				jgrq=java.sql.Date.valueOf(jgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！合同竣工日期『"+jgrqstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『房屋面积』是否正确
		if (fwmjstr[i]==null || fwmjstr[i].equals(""))
		{
			fwmj=0;
		}
		else{
			try{
				fwmj=(int)Double.parseDouble(fwmjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！房屋面积『"+fwmjstr[i]+"』不是数字类型！");
				return;
			}
		}

		//检查『实际开工日期』是否正确
		if (sjkgrqstr[i]==null || sjkgrqstr[i].equals(""))
		{
			sjkgrq=null;
		}
		else{
			try{
				sjkgrq=java.sql.Date.valueOf(sjkgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！实际开工日期『"+sjkgrqstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}

		//检查『实际竣工日期』是否正确
		if (sjjgrqstr[i]==null || sjjgrqstr[i].equals(""))
		{
			sjjgrq=null;
		}
		else{
			try{
				sjjgrq=java.sql.Date.valueOf(sjjgrqstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！实际竣工日期『"+sjjgrqstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
		//检查『保修截止时间』是否正确
		if (bxjzsjstr[i]==null || bxjzsjstr[i].equals(""))
		{
			bxjzsj=null;
		}
		else{
			try{
				bxjzsj=java.sql.Date.valueOf(bxjzsjstr[i].trim());
			}
			catch (Exception e){
				conn.rollback();
				out.print("<BR>序号『"+drxh[i]+"』错误！保修截止时间『"+bxjzsjstr[i]+"』不是日期类型格式『YYYY-MM-DD』！");
				return;
			}
		}
			

		String zxjwbm=null;
		ls_sql="select zxjwbm";
		ls_sql+=" from  dm_zxjwbm";
		ls_sql+=" where  qd<"+qye+" and "+qye+"<=zd";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zxjwbm=rs.getString("zxjwbm");
		}
		rs.close();
		ps.close();

		//项目专员
		String xmzy=null;
		ls_sql="select xmzy";
		ls_sql+=" from  sq_xmzy";
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmzy=rs.getString("xmzy");
		}
		rs.close();
		ps.close();

		if (!xxlybm[i].equals(""))
		{
			ls_sql="insert into crm_khxxly ( khbh,xxlybm,khlx)";
			ls_sql+=" values ( ?,?,'1')";//1：签约客户；2：咨询客户
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,xxlybm[i]);
			ps.executeUpdate();
			ps.close();
		}

		double zkl=10;
		if (wdzgce==0)
		{
			zkl=10;
		}
		else{
			zkl=qye*10/wdzgce;
		}
	
		ls_sql="insert into crm_khxx (khbh,khxm,hth,lxfs,qtdh,fwdz,khjl,sjs,zjxm,sgd ";
		ls_sql+=" ,mgfrz,nwgfrz,sdgfrz,yqgfrz,wdzgce,qye,qyrq,kgrq,jgrq,gcjdbm ";
		ls_sql+=" ,zxjwbm,xmzy,xxlysm,khlxbm,hxbm,ysbm,fwmj,sfyyh,yhyy,sjkgrq ";
		ls_sql+=" ,sjjgrq,bxjzsj,kbxbz,zkl,zjxzkl,dwbh,fgsbh,bz,lrr,lrsj,sgbz,sgdxm";
		ls_sql+=" ,suijin,suijinbfb,sjf,glf,guanlif,zjxje,zhzjxje,zjxsuijin,cdzwjmje,kglf";
		ls_sql+=" ,kqtk,sfke,cwsfke,zjxwcbz,khjsbz,sffj,sfyrz,pdclzt,jjwjbz,sjssjfjsbz";
		ls_sql+=" ,jlbz,dalqbz,gdjsjd,sjsjsbz,ywyjsbz,zjjsbz,sfxhf,ybjbz,hdbz,zt ";
		ls_sql+=" ,tsbz,bxbz,kpbz,hfdjbz,htshbz,zqsuijin,zqzjxsuijin,fjtcbz,sjhtsjf)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,? ";
		ls_sql+=" ,?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?,? ";
		ls_sql+=" ,0,0,0,0,0,0,0,0,0,0";
		ls_sql+=" ,0,0,0,'1','Y','N','N','2','Y','2'";
		ls_sql+=" ,'0','1','1','2','2','1','N','N','1','2' ";
		ls_sql+=" ,'N','N','Y','0','Y',0,0,'M',0) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,cf.GB2Uni(khxm[i]));
		ps.setString(3,cf.GB2Uni(hth[i]));
		ps.setString(4,cf.GB2Uni(lxfs[i]));
		ps.setString(5,cf.GB2Uni(qtdh[i]));
		ps.setString(6,cf.GB2Uni(fwdz[i]));
		ps.setString(7,cf.GB2Uni(khjl[i]));
		ps.setString(8,cf.GB2Uni(sjs[i]));
		ps.setString(9,cf.GB2Uni(zjxm[i]));
		ps.setString(10,sgd[i]);

		ps.setString(11,cf.GB2Uni(mgfrz[i]));
		ps.setString(12,cf.GB2Uni(nwgfrz[i]));
		ps.setString(13,cf.GB2Uni(sdgfrz[i]));
		ps.setString(14,cf.GB2Uni(yqgfrz[i]));
		ps.setDouble(15,wdzgce);
		ps.setDouble(16,qye);
		ps.setDate(17,qyrq);
		ps.setDate(18,kgrq);
		ps.setDate(19,jgrq);
		ps.setString(20,gcjdbm[i]);
		
		ps.setString(21,zxjwbm);
		ps.setString(22,xmzy);
		ps.setString(23,cf.GB2Uni(xxlysm[i]));	
		ps.setString(24,khlxbm[i]);	
		ps.setString(25,hxbm[i]);	
		ps.setString(26,ysbm[i]);	
		ps.setInt(27,fwmj);	
		ps.setString(28,sfyyh[i]);	
		ps.setString(29,cf.GB2Uni(yhyy[i]));	
		ps.setDate(30,sjkgrq);	

		ps.setDate(31,sjjgrq);	
		ps.setDate(32,bxjzsj);	
		ps.setString(33,kbxbz[i]);	
		ps.setDouble(34,zkl);
		ps.setDouble(35,zkl);
		ps.setString(36,dwbh[i]);
		ps.setString(37,fgsbh[i]);
		ps.setString(38,cf.GB2Uni(bz[i]));
		ps.setString(39,yhmc);	
		ps.setString(40,cf.GB2Uni(sgbz[i]));	
		ps.setString(41,cf.GB2Uni(sgdxm[i]));	
		ps.executeUpdate();
		ps.close();
		
	}
		

	conn.commit();

	out.print("<BR>数据导入成功，共导入记录数："+i);

 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
