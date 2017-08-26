<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String getdwbh=(String)session.getAttribute("dwbh");

String[] hth =request.getParameterValues("hth");
String[] jkjestr =request.getParameterValues("jkje");
String fgsbh=request.getParameter("fgsbh");

String rootPath=getServletContext().getRealPath("");
%>

<%
String ls_sql=null;
Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;


int count=0;
	


java.sql.Date sksj=cf.getDate();


try {

	conn1=cf.getConnection();    //得到连接

	conn1.setAutoCommit(false);

	int row=0;
	double alljkje=0;
	for (int i=0;i<hth.length ;i++ )
	{
		//二期拨款
		double jkje=0;
		if (jkjestr[i]!=null && !jkjestr[i].trim().equals(""))
		{
			try{
				jkje=Double.parseDouble(jkjestr[i].trim());
			}
			catch (Exception e) {
				conn1.rollback();
				out.print("序号["+i+"]出错！[材料款]非数字：" + jkjestr[i]);
				return;
			}
		}

		alljkje+=jkje;

		String khbh=null;//客户编号
		String khxm=null;//客户姓名
		String sjs=null;//设计师
		String sjsbh=null;//所属设计室编号
		String dwbh=null;//店面编码
		String sgd=null;
		String sgdmc=null;

		ls_sql=" select khbh,khxm,sjs,sjsbh,dwbh,crm_khxx.sgd,sgdmc" ;
		ls_sql+=" from crm_khxx,sq_sgd " ;
		ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd and hth='"+hth[i]+"' and fgsbh='"+fgsbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			khbh = rs1.getString("khbh").trim();			    
			khxm = rs1.getString("khxm");			    
			sjs = rs1.getString("sjs");			    
			sjsbh = rs1.getString("sjsbh");			    
			dwbh = rs1.getString("dwbh");			    
			sgd = rs1.getString("sgd");			    
			sgdmc = rs1.getString("sgdmc");			    
		}
		else{
			conn1.rollback();
			out.println("<BR>错误！合同号["+hth[i]+"]不存在");
			return;
		}
		rs1.close();
		ps1.close();

		
		//导入ERP++++++++++++++++++ 

		count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jklx='2'";//1：生活费；2：材料款；3：中期拨款；9：其它
		ps1= conn1.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			conn1.rollback();
			out.println("错误！[材料款]已存在:"+khbh);
			return;
		}

		
		String gdjkjlh=null;
		ls_sql="select NVL(max(substr(gdjkjlh,8,2)),0)";
		ls_sql+=" from  cw_gdjkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn1.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		gdjkjlh=khbh+cf.addZero(count+1,2);
		
		ls_sql="insert into cw_gdjkjl ( gdjkjlh,khbh,jklx,jkje,jkblr,jkblsj,lrr,lrsj,lrbm,bz,gdjsjd,scbz,czlx ) ";
		ls_sql+=" values('"+gdjkjlh+"','"+khbh+"','2',"+jkje+",'"+yhmc+"',TRUNC(SYSDATE),'"+yhmc+"',SYSDATE,'"+getdwbh+"','导入','0','N','3' ) ";//1：录入；2：导出；3：导入
		ps1= conn1.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		//导入ERP------------------ 

		row++;

	}


	conn1.commit();

	%>
	<P>成功导入ERP，共导入记录数：<%=row%>
	<%

}
catch (Exception e) {
	conn1.rollback();

	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn1.setAutoCommit(true);

	try{
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn1 != null) cf.close(conn1);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
