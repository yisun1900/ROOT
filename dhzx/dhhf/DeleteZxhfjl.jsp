<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] hfjlh = request.getParameterValues("hfjlh");
if (hfjlh.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}

String newkhbh=null;
String newhfjg=null;
String newsfghdm=null;
String newzxdm=null;
String newyhjs=null;
String newsfjxhf=null;
String newxchfrq=null;

String yhjs=null;


java.sql.Date yzxhfsj=null;
String yhfjlh=null;
String ysfxhf=null;
java.sql.Date yhfrq=null;
String yzxdm=null;
String yzxzt=null;
String ysjs=null;

String ylfbz=null;
java.sql.Date ylfsj=null;
String yctbz=null;
java.sql.Date yctsj=null;

String nowzxhfsj=null;
String nowhfjlh=null;
String nowsfxhf=null;
String nowhfrq=null;
String nowzxdm=null;
String nowzxzt=null;
String nowsjs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,hfjg,sfghdm,zxdm,sfjxhf,xchfrq,ysfxhf,yhfrq,yzxhfsj,yhfjlh,yzxdm,yzxzt,ysjs,yhjs,ylfbz,ylfsj,yctbz,yctsj";
	ls_sql+=" from  crm_zxhfjl";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newkhbh=rs.getString("khbh");
		newhfjg=rs.getString("hfjg");
		newsfghdm=rs.getString("sfghdm");
		newzxdm=cf.fillNull(rs.getString("zxdm"));
		newsfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		newxchfrq=cf.fillNull(rs.getDate("xchfrq"));

		ysfxhf=rs.getString("ysfxhf");
		yhfrq=rs.getDate("yhfrq");
		yzxhfsj=rs.getDate("yzxhfsj");
		yhfjlh=rs.getString("yhfjlh");
		yzxdm=rs.getString("yzxdm");
		yzxzt=rs.getString("yzxzt");
		ysjs=cf.fillNull(rs.getString("ysjs"));

		ylfbz=rs.getString("ylfbz");
		ylfsj=rs.getDate("ylfsj");
		yctbz=rs.getString("yctbz");
		yctsj=rs.getDate("yctsj");

		yhjs=rs.getString("yhjs");
	
	}
	else{
		out.println("错误！不存在的回访记录号"+hfjlh[0]);
		return;
	}
	ps.close();
	rs.close();

	ls_sql="select sfxhf,hfrq,zxhfsj,hfjlh,zxdm,zxzt,sjs";
	ls_sql+=" from  crm_zxkhxx where khbh='"+newkhbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowsfxhf=rs.getString("sfxhf");
		nowhfrq=cf.fillNull(rs.getDate("hfrq"));
		nowzxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		nowhfjlh=cf.fillNull(rs.getString("hfjlh"));
		nowzxdm=cf.fillNull(rs.getString("zxdm"));
		nowzxzt=rs.getString("zxzt");
		nowsjs=cf.fillNull(rs.getString("sjs"));
	}
	else{
		out.println("错误！不存在的客户编号"+newkhbh);
		return;
	}
	ps.close();
	rs.close();

	if (!nowhfjlh.equals(hfjlh[0]))
	{
		out.println("错误！只能删除最新的回访记录号"+nowhfjlh);
		return;
	}


	conn.setAutoCommit(false);


	if (yhjs.equals("F2"))//F2：店面
	{
		if (newhfjg.equals("2"))//2：已签约
		{
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，修改失败");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，修改失败");
				return;
			}

			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("错误！[设计师]已改变，修改失败，目前："+nowsjs+"，当时："+ysjs);
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("错误！[咨询店面]已改变，修改失败");
				return;
			}

			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else if (newhfjg.equals("3")){//3：失败
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，修改失败");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，修改失败");
				return;
			}
		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("错误！[设计师]已改变，修改失败");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("错误！[咨询店面]已改变，修改失败");
				return;
			}
			
			if (!nowzxzt.equals("2"))
			{
				conn.rollback();
				out.println("错误！[咨询状态]已改变，修改失败");
				return;
			}

			
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,sjs=?,zxdm=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ysjs);
			ps.setString(6,yzxdm);
			ps.setString(7,yzxzt);
			ps.setString(8,ylfbz);
			ps.setDate(9,ylfsj);
			ps.setString(10,yctbz);
			ps.setDate(11,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else{//1：继续跟踪
			if (!nowsfxhf.equals(newsfjxhf))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，修改失败");
				return;
			}
			if (!nowhfrq.equals(newxchfrq))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，修改失败");
				return;
			}

			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("错误！[设计师]已改变，修改失败");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("错误！[咨询店面]已改变，修改失败");
				return;
			}

			
			if (!nowzxzt.equals(yzxzt))
			{
				conn.rollback();
				out.println("错误！[咨询状态]已改变，修改失败");
				return;
			}

			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ylfbz);
			ps.setDate(6,ylfsj);
			ps.setString(7,yctbz);
			ps.setDate(8,yctsj);
			ps.executeUpdate();
			ps.close();
		}
	}
	else{//非店面
		if (newhfjg.equals("2"))//2：已签约
		{
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，修改失败");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，修改失败");
				return;
			}

		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("错误！[设计师]已改变，修改失败");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("错误！[咨询店面]已改变，修改失败");
				return;
			}

		
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?,lfbz=?,lfsj=?,ctbz=?,ctsj=? ";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();
		}
		else if (newhfjg.equals("3")){//3：失败
			if (!nowsfxhf.equals("N"))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，修改失败");
				return;
			}
			if (!nowhfrq.equals(""))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，修改失败");
				return;
			}

		
			if (!nowsjs.equals(ysjs))
			{
				conn.rollback();
				out.println("错误！[设计师]已改变，修改失败");
				return;
			}
			if (!nowzxdm.equals(yzxdm))
			{
				conn.rollback();
				out.println("错误！[咨询店面]已改变，修改失败");
				return;
			}

		
			if (!nowzxzt.equals("4"))
			{
				conn.rollback();
				out.println("错误！[咨询状态]已改变，修改失败");
				return;
			}

			
			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,zxzt=?, sbyybm=null,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,yzxzt);
			ps.setString(6,ylfbz);
			ps.setDate(7,ylfsj);
			ps.setString(8,yctbz);
			ps.setDate(9,yctsj);
			ps.executeUpdate();
			ps.close();

		}
		else{//1：继续跟踪
			if (!nowsfxhf.equals(newsfjxhf))
			{
				conn.rollback();
				out.println("错误！[是否需回访]已改变，删除失败");
				return;
			}
			if (!nowhfrq.equals(newxchfrq))
			{
				conn.rollback();
				out.println("错误！[应回访日期]已改变，删除失败，设置为"+newxchfrq+";目前为"+nowhfrq+";");
				return;
			}

			if (newsfghdm.equals("Y"))//Y：更换
			{
				if (!nowsjs.equals(""))
				{
					conn.rollback();
					out.println("错误！[设计师]已改变，删除失败");
					return;
				}
				if (!nowzxdm.equals(newzxdm))
				{
					conn.rollback();
					out.println("错误！[咨询店面]已改变，删除失败");
					return;
				}
				
				if (!nowzxzt.equals("5"))
				{
					conn.rollback();
					out.println("错误！[咨询状态]已改变，删除失败");
					return;
				}
			}
			else{//N：不更换
				if (!nowsjs.equals(ysjs))
				{
					conn.rollback();
					out.println("错误！[设计师]已改变，删除失败");
					return;
				}
				if (!nowzxdm.equals(yzxdm))
				{
					conn.rollback();
					out.println("错误！[咨询店面]已改变，删除失败");
					return;
				}

				
				if (!nowzxzt.equals(yzxzt))
				{
					conn.rollback();
					out.println("错误！[咨询状态]已改变，删除失败");
					return;
				}
			}


			ls_sql =" update crm_zxkhxx set sfxhf=?,hfrq=?,hfjlh=?,zxhfsj=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?";
			ls_sql+=" where khbh='"+newkhbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ysfxhf);
			ps.setDate(2,yhfrq);
			ps.setString(3,yhfjlh);
			ps.setDate(4,yzxhfsj);
			ps.setString(5,ylfbz);
			ps.setDate(6,ylfsj);
			ps.setString(7,yctbz);
			ps.setDate(8,yctsj);
			ps.executeUpdate();
			ps.close();

			if (newsfghdm.equals("Y"))//N：不更换；Y：更换
			{
				ls_sql="update crm_zxkhxx set sjs=?,zxdm=?,zxzt=? where khbh='"+newkhbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ysjs);
				ps.setString(2,yzxdm);
				ps.setString(3,yzxzt);
				ps.executeUpdate();
				ps.close();
			}
		}
	}


	ls_sql="delete from crm_zxhfjl ";
	ls_sql+=" where hfjlh='"+hfjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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