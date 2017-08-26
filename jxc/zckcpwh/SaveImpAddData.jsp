<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String[] dqbm = request.getParameterValues("dqbm");
String zcbmfs = request.getParameter("zcbmfs");


String[] xuhao =request.getParameterValues("xuhao");
String[] cldlbm =request.getParameterValues("cldlbm");
String[] clxlbm =request.getParameterValues("clxlbm");
String[] ppmc =request.getParameterValues("ppmc");
String[] cllbbm =request.getParameterValues("cllbbm");

String[] getclbm =request.getParameterValues("clbm");
String[] nbbm =request.getParameterValues("nbbm");

String[] clmc =request.getParameterValues("clmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] clysbm =request.getParameterValues("clysbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] lsjstr =request.getParameterValues("lsj");
String[] xsjstr =request.getParameterValues("xsj");
String[] zdxsjstr =request.getParameterValues("zdxsj");
String[] yjjrblstr =request.getParameterValues("yjjrbl");

String[] jsfs =request.getParameterValues("jsfs");
String[] cbjstr =request.getParameterValues("cbj");
String[] jsblstr =request.getParameterValues("jsbl");
String[] cxhdblstr =request.getParameterValues("cxhdbl");
String[] sfycx =request.getParameterValues("sfycx");
String[] cxkssjstr =request.getParameterValues("cxkssj");
String[] cxjzsjstr =request.getParameterValues("cxjzsj");
String[] cxjstr =request.getParameterValues("cxj");
String[] cxjsblstr =request.getParameterValues("cxjsbl");
String[] cxcbjstr =request.getParameterValues("cxcbj");
String[] lscxhdblstr =request.getParameterValues("lscxhdbl");
String[] cxyjjrblstr =request.getParameterValues("cxyjjrbl");


String[] sfbhpj =request.getParameterValues("sfbhpj");
String[] pjtsstr =request.getParameterValues("pjts");
String[] sfyh =request.getParameterValues("sfyh");

String[] cpjb =request.getParameterValues("cpjb");
String[] fgsx =request.getParameterValues("fgsx");
String[] cpsm =request.getParameterValues("cpsm");
String[] cd =request.getParameterValues("cd");
String[] sftjcp =request.getParameterValues("sftjcp");
String[] zp =request.getParameterValues("zp");
String[] bz =request.getParameterValues("bz");
String[] xsfs =request.getParameterValues("xsfs");

String[] bzjldwbm =request.getParameterValues("bzjldwbm");
String[] bzgg =request.getParameterValues("bzgg");
String[] djzl =request.getParameterValues("djzl");
String[] clcd =request.getParameterValues("clcd");
String[] clkd =request.getParameterValues("clkd");
String[] clgd =request.getParameterValues("clgd");
String[] cgzq =request.getParameterValues("cgzq");
String[] bzq =request.getParameterValues("bzq");
String[] bztxq =request.getParameterValues("bztxq");
String[] zdkcslStr =request.getParameterValues("zdkcsl");
String[] zdkcjeStr =request.getParameterValues("zdkcje");
String[] cglb =request.getParameterValues("cglb");
  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //得到连接

	System.out.println("开始增加主材报价，操作人："+yhmc);


	int count=0;
	sql="select NVL(max(SUBSTR(clbm,4,11)),0)";
	sql+=" from  jxc_clbm";
	sql+=" where cllb='2'";//0：代销品主材；1：辅材；2：库存品主材
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		double lsj=0;
		double xsj=0;
		double cbj=0;
		double jsbl=0;
		double cxhdbl=0;
		java.sql.Date cxkssj=null;
		java.sql.Date cxjzsj=null;
		double cxj=0;
		double cxcbj=0;
		double lscxhdbl=0;
		int pjts=0;

		double zdxsj=0;
		double yjjrbl=0;
		double cxjsbl=0;
		double cxyjjrbl=0;

		double zdkcsl=0;
		double zdkcje=0;

		//市场标价
		lsj=0;
		if (lsjstr[i]!=null && !lsjstr[i].equals(""))
		{
			lsj=Double.parseDouble(lsjstr[i]);
		}
		//销售价
		xsj=0;
		if (xsjstr[i]!=null && !xsjstr[i].equals(""))
		{
			xsj=Double.parseDouble(xsjstr[i]);
		}
		//最低销售限价
		if (zdxsjstr[i]!=null && !zdxsjstr[i].equals(""))
		{
			zdxsj=Double.parseDouble(zdxsjstr[i]);
		}
		//业绩记入比例
		if (yjjrblstr[i]!=null && !yjjrblstr[i].equals(""))
		{
			yjjrbl=Double.parseDouble(yjjrblstr[i]);
		}
		//结算价
		cbj=0;
		if (cbjstr[i]!=null && !cbjstr[i].equals(""))
		{
			cbj=Double.parseDouble(cbjstr[i]);
		}
		//结算比例
		jsbl=0;
		if (jsblstr[i]!=null && !jsblstr[i].equals(""))
		{
			jsbl=Double.parseDouble(jsblstr[i]);
		}
		//计入活动比例
		cxhdbl=0;
		if (cxhdblstr[i]!=null && !cxhdblstr[i].equals(""))
		{
			cxhdbl=Double.parseDouble(cxhdblstr[i]);
		}


		//促销价
		cxj=0;
		if (cxjstr[i]!=null && !cxjstr[i].equals(""))
		{
			cxj=Double.parseDouble(cxjstr[i]);
		}
		//促销结算价
		cxcbj=0;
		if (cxcbjstr[i]!=null && !cxcbjstr[i].equals(""))
		{
			cxcbj=Double.parseDouble(cxcbjstr[i]);
		}
		//促销期结算比例
		if (cxjsblstr[i]!=null && !cxjsblstr[i].equals(""))
		{
			cxjsbl=Double.parseDouble(cxjsblstr[i]);
		}
		//促销期计入活动比例
		lscxhdbl=0;
		if (lscxhdblstr[i]!=null && !lscxhdblstr[i].equals(""))
		{
			lscxhdbl=Double.parseDouble(lscxhdblstr[i]);
		}
		//促销期业绩记入比例
		cxyjjrbl=0;
		if (cxyjjrblstr[i]!=null && !cxyjjrblstr[i].equals(""))
		{
			cxyjjrbl=Double.parseDouble(cxyjjrblstr[i]);
		}
		//促销开始时间
		cxkssj=null;
		if (cxkssjstr[i]!=null && !cxkssjstr[i].equals(""))
		{
			cxkssj=java.sql.Date.valueOf(cxkssjstr[i]);
		}
		//促销结束时间
		cxjzsj=null;
		if (cxjzsjstr[i]!=null && !cxjzsjstr[i].equals(""))
		{
			cxjzsj=java.sql.Date.valueOf(cxjzsjstr[i]);
		}
		//配件套数
		pjts=0;
		if (pjtsstr[i]!=null && !pjtsstr[i].equals(""))
		{
			pjts=Integer.parseInt(pjtsstr[i]);
		}

		//最低库存数量
		zdkcsl=0;
		if (zdkcslStr[i]!=null && !zdkcslStr[i].equals(""))
		{
			zdkcsl=Double.parseDouble(zdkcslStr[i]);
		}
		//最低库存金额
		zdkcje=0;
		if (zdkcjeStr[i]!=null && !zdkcjeStr[i].equals(""))
		{
			zdkcje=Double.parseDouble(zdkcjeStr[i]);
		}

		count++;

		String clbm="";
		if (zcbmfs.equals("2"))//主材编码导入
		{
			clbm=getclbm[i];

			if (clbm.length()!=13)
			{
				conn.rollback();
				out.println("<BR>序号["+xuhao[i]+"]出错！[主材编码】长度应为13位:"+clbm);
				return;
			}
			else
			{
				if (!clbm.startsWith("ZC2"))
				{
					conn.rollback();
					out.println("<BR>序号["+xuhao[i]+"]出错！[主材编码】应该以【ZC2】开头:"+clbm);
					return;
				}
				else{
					try
					{
						Integer.parseInt(clbm.substring(3,13));
					}
					catch(Exception e)
					{
						conn.rollback();
						out.println("<BR>序号["+xuhao[i]+"]出错！[主材编码】后10位应该是数字:"+clbm.substring(3,13));
						return;
					}
				}
			}


//			int count=0;
			sql=" select count(*)" ;
			sql+=" from jxc_clbm " ;
			sql+=" where  clbm='"+clbm+"'" ;
			ps= conn.prepareStatement(sql);
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
				out.println("<BR>！！！序号["+xuhao[i]+"]错误，[主材编码]已存在："+clbm);
				return;
			}
		}
		else{
			clbm="ZC2"+cf.addZero(count,10);
		}

		//品牌
		String scsmc=null;
		String getcldlbm=null;

		sql=" select scsmc,cldl" ;
		sql+=" from jxc_ppxx " ;
		sql+=" where ppmc='"+cf.GB2Uni(ppmc[i])+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			scsmc = rs.getString("scsmc");			    
			getcldlbm = rs.getString("cldl");			    
		}
		else{
			conn.rollback();
			out.println("<BR>！！！序号["+xuhao[i]+"]错误，不存在的[子品牌名称]：【"+cf.GB2Uni(ppmc[i])+"】");
			return;
		}
		rs.close();
		ps.close();

		if (!getcldlbm.equals(cf.GB2Uni(cldlbm[i])))
		{
			conn.rollback();
			out.println("<BR>！！！序号["+xuhao[i]+"]错误，[子品牌:"+cf.GB2Uni(ppmc[i])+"]与[材料大类:"+cf.GB2Uni(cldlbm[i])+"]无对应关系");
			return;
		}

		sql ="insert into jxc_clbm (cldlbm,clxlbm,ppmc,cllbbm,clbm,clmc";
		sql+=" ,xh,gg,clysbm,jldwbm,cllb,cglb";
		sql+=" ,sfbhpj,pjts,cpjb,fgsx";
		sql+=" ,cpsm,cd,scsmc,zp,lrr,lrsj,lrbm,bz,nbbm ";
		sql+=" ,bzjldwbm,bzgg,cgzq,djzl,bzq,bztxq,clcd,clkd,clgd)";
		sql+=" values('"+cf.GB2Uni(cldlbm[i])+"','"+cf.GB2Uni(clxlbm[i])+"','"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(cllbbm[i])+"','"+clbm+"','"+cf.GB2Uni(clmc[i])+"'";
		sql+=" ,'"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"','"+cf.GB2Uni(clysbm[i])+"','"+cf.GB2Uni(jldwbm[i])+"','2','"+cglb[i]+"'";
		sql+=" ,'"+sfbhpj[i]+"',"+pjts+",'"+cf.GB2Uni(cpjb[i])+"','"+cf.GB2Uni(fgsx[i])+"'";
		sql+=" ,'"+cf.GB2Uni(cpsm[i])+"','"+cf.GB2Uni(cd[i])+"','"+scsmc+"','"+cf.GB2Uni(zp[i])+"','"+yhmc+"',SYSDATE,'"+lrbm+"','"+cf.GB2Uni(bz[i])+"','"+cf.GB2Uni(nbbm[i])+"'";
		sql+=" ,'"+cf.GB2Uni(bzjldwbm[i])+"','"+bzgg[i]+"','"+cgzq[i]+"','"+djzl[i]+"','"+bzq[i]+"','"+bztxq[i]+"','"+clcd[i]+"','"+clkd[i]+"','"+clgd[i]+"'";
		sql+="  )";
//		out.println(sql);
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		for (int j=0;j<dqbm.length ;j++ )
		{
			String gysmc=null;
			sql=" select jxc_ppgysdzb.gysmc" ;
			sql+=" from jxc_ppxx,jxc_ppgysdzb " ;
			sql+=" where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppxx.ppmc='"+cf.GB2Uni(ppmc[i])+"' " ;
			sql+=" and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm[j]+"')" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				gysmc = rs.getString("gysmc");			    
			}
			else{
				conn.rollback();
				out.println("<BR>！！！序号["+xuhao[i]+"]错误，在地区["+dqbm[j]+"]不存在[子品牌供应商对照表]：【"+cf.GB2Uni(ppmc[i])+"】");
				return;
			}
			rs.close();
			ps.close();



			sql ="insert into jxc_cljgb (clbm,dqbm,cllb,gysmc,lsj,xsj,cbj,jsbl,cxhdbl";
			sql+=" ,sfycx,cxkssj,cxjzsj";
			sql+=" ,cxj,cxcbj,lscxhdbl,sfyh,sftjcp";
			sql+=" ,lrr,lrsj,lrbm,ssfgs,dfgsjg,dgzjg,zxqdl,xsfs,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl,zdkcsl,zdkcje,jsfs,zdxsj,yjjrbl,cxjsbl,cxyjjrbl)";
			sql+=" values('"+clbm+"','"+dqbm[j]+"','2','"+gysmc+"',"+lsj+","+xsj+","+cbj+","+jsbl+","+cxhdbl;
			sql+=" ,'"+sfycx[i]+"',TO_DATE('"+cxkssjstr[i]+"','YYYY-MM-DD')"+",TO_DATE('"+cxjzsjstr[i]+"','YYYY-MM-DD')";
			sql+=" ,"+cxj+","+cxcbj+","+lscxhdbl+",'"+sfyh[i]+"','"+sftjcp[i]+"'";
			sql+=" ,'"+yhmc+"',SYSDATE,'"+lrbm+"','"+ssfgs+"',0,0,0,'"+xsfs[i]+"',0,0,0,0,0,"+zdkcsl+","+zdkcje+",'"+jsfs[i]+"',"+zdxsj+","+yjjrbl+","+cxjsbl+","+cxyjjrbl;
			sql+="  )";
	//		out.println(sql);
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}





		if (i%200==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("增加主材报价完成，操作人："+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[增加新的主材报价]成功！");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>出错序号：" + xuhao[i]);
	out.print("<P>存盘失败,发生意外: " + e);
	out.print("<P>sql=" + sql);
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
