<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zckx=cf.GB2Uni(request.getParameter("zckx"));
String fklxbm=cf.GB2Uni(request.getParameter("fklxbm"));
String getgysbh=cf.GB2Uni(cf.getParameter(request,"gysbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gysstr="";

try {
	conn=cf.getConnection();

	String getddbh="";
	String getzjxbh="";
	int pos=getgysbh.indexOf("*");
	if (pos!=-1)
	{
		getddbh=getgysbh.substring(pos+1);
		getgysbh=getgysbh.substring(0,pos);
	}
	pos=getddbh.indexOf("*");
	if (pos!=-1)
	{
		getzjxbh=getddbh.substring(pos+1);
		getddbh=getddbh.substring(0,pos);
	}


	if (zckx.equals("23"))//主材款
	{
		String zcmmbz="";//主材收款检查
		ls_sql=" select zcmmbz ";
		ls_sql+=" from sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		}
		rs.close();
		ps.close();

		if (zcmmbz.equals("Y"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysbh=null;
			String ddbh=null;
			String zjxbh=null;
			String fkje=null;
			String ls="";
			if (fklxbm.equals(zckx))
			{
				if (getzjxbh.equals(""))
				{
					ls_sql="select gysbh,ddbh,zjxbh,sum(fkje) fkje";
					ls_sql+=" from cw_khfkjl ";
					ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
					ls_sql+=" and ((ddbh!='"+getddbh+"' and zjxbh is null) OR  zjxbh is not null)";
					ls_sql+=" group by gysbh,ddbh,zjxbh";
					ls_sql+=" order by gysbh,ddbh,zjxbh ";
				}
				else {
					ls_sql="select gysbh,ddbh,zjxbh,sum(fkje) fkje";
					ls_sql+=" from cw_khfkjl ";
					ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
					ls_sql+=" and (zjxbh is null OR zjxbh!='"+getzjxbh+"')";
					ls_sql+=" group by gysbh,ddbh,zjxbh";
					ls_sql+=" order by gysbh,ddbh,zjxbh ";
				}
			}
			else{
				ls_sql="select gysbh,ddbh,zjxbh,sum(fkje) fkje";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
				ls_sql+=" group by gysbh,ddbh,zjxbh";
				ls_sql+=" order by gysbh,ddbh,zjxbh ";
			}
//			out.println(ls_sql);
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				gysbh=cf.fillNull(rs.getString("gysbh"));
				ddbh=cf.fillNull(rs.getString("ddbh"));
				zjxbh=cf.fillNull(rs.getString("zjxbh"));
				fkje=rs.getString("fkje");

				if (zjxbh.equals(""))
				{
					ls+="%"+gysbh+"*"+ddbh+"*"+zjxbh+"+"+gysbh+"（单号:"+ddbh+"）（￥"+fkje+"）";
				}
				else {
					ls+="%"+gysbh+"*"+ddbh+"*"+zjxbh+"+"+gysbh+"（单号:"+zjxbh+"）（￥"+fkje+"）";
				}
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		else if (zcmmbz.equals("N"))//Y：取订单；N：取数据字典；M：可空
		{
			String gysbh=null;
			String fkje=null;
			String ls="";

			ls="";

			if (fklxbm.equals(zckx))
			{
				ls_sql="select gysbh,sum(fkje) fkje";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
				ls_sql+=" and gysbh is not null";
				ls_sql+=" and gysbh!='"+getgysbh+"'";
				ls_sql+=" group by gysbh";
				ls_sql+=" order by gysbh ";
			}
			else{
				ls_sql="select gysbh,sum(fkje) fkje";
				ls_sql+=" from cw_khfkjl ";
				ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='23' ";
				ls_sql+=" and gysbh is not null";
				ls_sql+=" group by gysbh";
				ls_sql+=" order by gysbh ";
			}
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				gysbh=rs.getString("gysbh");
				fkje=rs.getString("fkje");

				ls+="%"+gysbh+"+"+gysbh+"（￥"+fkje+"）";
			}
			rs.close();
			ps.close();

			if (!ls.equals(""))
			{
				gysstr=ls.substring(1);
				out.print(gysstr);
			}
		}
		//收款品牌----------------------------
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>