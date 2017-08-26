<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String hflxbm=null;
String khbh=null;
String sjfa=null;
String hqfw=null;
String jdqk=null;
String zjyfw=null;
String zjydw=null;
String zjyjz=null;
String fwsz=null;
String sgzl=null;
String grsz=null;
String sjshfnr=null;
String zjyhfnr=null;
String sgdhfnr=null;
String sfjxhf=null;
java.sql.Date xchfrq=null;
String xchflxbm=null;
String clfs=null;
String bz=cf.GB2Uni(request.getParameter("bz"));
String jglxbm=request.getParameter("jglxbm");
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sjfa=cf.GB2Uni(request.getParameter("sjfa"));
hqfw=cf.GB2Uni(request.getParameter("hqfw"));
jdqk=cf.GB2Uni(request.getParameter("jdqk"));
zjyfw=cf.GB2Uni(request.getParameter("zjyfw"));
zjydw=cf.GB2Uni(request.getParameter("zjydw"));
zjyjz=cf.GB2Uni(request.getParameter("zjyjz"));
fwsz=cf.GB2Uni(request.getParameter("fwsz"));
sgzl=cf.GB2Uni(request.getParameter("sgzl"));
grsz=cf.GB2Uni(request.getParameter("grsz"));
sjshfnr=cf.GB2Uni(request.getParameter("sjshfnr"));
zjyhfnr=cf.GB2Uni(request.getParameter("zjyhfnr"));
sgdhfnr=cf.GB2Uni(request.getParameter("sgdhfnr"));
sfjxhf=cf.GB2Uni(request.getParameter("sfjxhf"));
ls=request.getParameter("xchfrq");
try{
	if (!(ls.equals("")))  xchfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xchfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[下次回访日期]类型转换发生意外:"+e);
	return;
}
xchflxbm=cf.GB2Uni(request.getParameter("xchflxbm"));
clfs=cf.GB2Uni(request.getParameter("clfs"));
String[] dwbh=request.getParameterValues("dwbh");

String jcjjsjs=request.getParameter("jcjjsjs");
String jsjjgw=request.getParameter("jsjjgw");
String jcxmzy=request.getParameter("jcxmzy");
String jcshaz=request.getParameter("jcshaz");
String jccpzl=request.getParameter("jccpzl");
String jchfnr=cf.GB2Uni(request.getParameter("jchfnr"));

String wherehfjlh=null;
wherehfjlh=cf.GB2Uni(request.getParameter("wherehfjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	//回访记录号
	String oldzxhfbz="";//最新回访标志
	String oldhfszjlh="";
	String oldsfjxhf="";//设置下次回访时间
	String oldysfxhf=null;
	java.sql.Date oldyhfrq=null;
	String oldyhflxbm=null;
	ls_sql="select zxhfbz,hfszjlh,sfjxhf,ysfxhf,yhfrq,yhflxbm";
	ls_sql+=" from  crm_hfjl ";
	ls_sql+=" where hfjlh='"+wherehfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldzxhfbz=cf.fillNull(rs.getString("zxhfbz"));
		oldhfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		oldsfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		oldysfxhf=cf.fillNull(rs.getString("ysfxhf"));
		oldyhfrq=rs.getDate("yhfrq");
		oldyhflxbm=cf.fillNull(rs.getString("yhflxbm"));
	}
	ps.close();
	rs.close();
	if (!oldzxhfbz.equals("Y"))
	{
		out.println("错误！只能修改最新一次的回访记录");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_gchffkbm where clzt='Y' and hfjlh="+wherehfjlh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("错误！有关部门已对回访做了处理，不能再修改");
		return;
	}

	//获取回访设置记录信息
	String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
	String getzxszbz="";//最新设置标志  ,Y：是；N：否
	String yhfszjlh=null;
	ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
		yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	if (oldsfjxhf.equals("Y") || oldsfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
	{
		if (getsfyhf.equals("N"))//客服没有实际回访
		{
			if (getzxszbz.equals("Y"))//是最新记录，改变回访信息
			{
				if (sfjxhf.equals("Y") || sfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
				{
					ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,"Y");
					ps.setDate(2,xchfrq);
					ps.setString(3,xchflxbm);
					ps.executeUpdate();
					ps.close();

					ls_sql="update crm_hfszjl set hflxbm=?,hfsj=?,hfszr=?,hfszsj=SYSDATE";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,xchflxbm);
					ps.setDate(2,xchfrq);
					ps.setString(3,yhmc);
					ps.executeUpdate();
					ps.close();
				}
				else{//新的不需设置，删除
					ls_sql="update crm_khxx set sfxhf='N',hflxbm=null,hfrq=null";
					ls_sql+=" where  khbh='"+khbh+"' ";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();


					//删除回访设置记录
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();

					ls_sql=" update crm_hfszjl set zxszbz='Y'";	
					ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
			else{//不是最新记录，不改变回访信息
				if (sfjxhf.equals("Y") || sfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
				{
					ls_sql="update crm_hfszjl set hflxbm=?,hfsj=?,hfszr=?,hfszsj=SYSDATE";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,xchflxbm);
					ps.setDate(2,xchfrq);
					ps.setString(3,yhmc);
					ps.executeUpdate();
					ps.close();
				}
				else{//新的不需设置，删除,下一级与前一级关联,删除本级
					//取下一级
					String nexthfszjlh=null;
					ls_sql="SELECT hfszjlh ";
					ls_sql+=" FROM crm_hfszjl ";
					ls_sql+=" where  khbh='"+khbh+"' and yhfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						nexthfszjlh=cf.fillNull(rs.getString("hfszjlh"));
					}
					rs.close();
					ps.close();

					//下一级与前一级关联
					ls_sql=" update crm_hfszjl set yhfszjlh=?";	
					ls_sql+=" where hfszjlh='"+nexthfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.setString(1,yhfszjlh);
					ps.executeUpdate();
					ps.close();

					//删除本级回访设置记录
					ls_sql="delete from crm_hfszjl ";
					ls_sql+=" where  hfszjlh='"+oldhfszjlh+"'";
					ps= conn.prepareStatement(ls_sql);
					ps.executeUpdate();
					ps.close();
				}
			}
		}
	}
	else//没设置过
	{
		if (sfjxhf.equals("Y") || sfjxhf.equals("F"))//Y：设置；N：不设置；F：重新回访
		{
			ls_sql="update crm_khxx set sfxhf=?,hfrq=?,hflxbm=? where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,"Y");
			ps.setDate(2,xchfrq);
			ps.setString(3,xchflxbm);
			ps.executeUpdate();
			ps.close();

			//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			String newyhfszjlh=null;
			ls_sql="select hfszjlh";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				newyhfszjlh=rs.getString("hfszjlh");
			}
			rs.close();
			ps.close();

			ls_sql=" update crm_hfszjl set zxszbz='N'";	
			ls_sql+=" where  khbh='"+khbh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String hfszjlh=null;
			count=0;
			ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
			ls_sql+=" from  crm_hfszjl";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();

			hfszjlh=khbh+cf.addZero(count+1,3);

			oldhfszjlh=hfszjlh;//回访设置记录号发生变化

			String hfszyy=wherehfjlh+":回访时设置";
			ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
			ls_sql+=" values ( ?,?,?,?,?,SYSDATE,?,'2',?,'N','Y',?) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,hfszjlh);
			ps.setString(2,khbh);
			ps.setString(3,xchflxbm);
			ps.setDate(4,xchfrq);
			ps.setString(5,yhmc);
			ps.setString(6,hfszyy);
			ps.setString(7,wherehfjlh);
			ps.setString(8,newyhfszjlh);
			ps.executeUpdate();
			ps.close();
			//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		}
	}



	
	ls_sql="update crm_hfjl set hflxbm=?,khbh=?,sjfa=?,hqfw=?,jdqk=?,sjshfnr=?,zjyfw=?,zjydw=?,zjyjz=?,zjyhfnr=?,fwsz=?,sgzl=?,grsz=?,sgdhfnr=?,sfjxhf=?,xchfrq=?,xchflxbm=?,clfs=?,jglxbm=?,bz=?,jcjjsjs=?,jsjjgw=?,jcxmzy=?,jcshaz=?,jccpzl=?,jchfnr=?,hfszjlh=?";
	ls_sql+=" where  (hfjlh="+wherehfjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hflxbm);
	ps.setString(2,khbh);
	ps.setString(3,sjfa);
	ps.setString(4,hqfw);
	ps.setString(5,jdqk);
	ps.setString(6,sjshfnr);
	ps.setString(7,zjyfw);
	ps.setString(8,zjydw);
	ps.setString(9,zjyjz);
	ps.setString(10,zjyhfnr);
	ps.setString(11,fwsz);
	ps.setString(12,sgzl);
	ps.setString(13,grsz);
	ps.setString(14,sgdhfnr);
	ps.setString(15,sfjxhf);
	ps.setDate(16,xchfrq);
	ps.setString(17,xchflxbm);
	ps.setString(18,clfs);
	ps.setString(19,jglxbm);
	ps.setString(20,bz);

	ps.setString(21,jcjjsjs);
	ps.setString(22,jsjjgw);
	ps.setString(23,jcxmzy);
	ps.setString(24,jcshaz);
	ps.setString(25,jccpzl);
	ps.setString(26,jchfnr);
	ps.setString(27,oldhfszjlh);

	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_gchffkbm where hfjlh="+wherehfjlh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (dwbh!=null)
	{
		for (int i=0;i<dwbh.length ;i++ )
		{
			ls_sql="insert into crm_gchffkbm (hfjlh,dwbh,clzt ) ";
			ls_sql+=" values (?,?,'N') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,wherehfjlh);
			ps.setString(2,dwbh[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>