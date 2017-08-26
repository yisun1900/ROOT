<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] mgfrz=request.getParameterValues("mgfrz");
String[] nwgfrz=request.getParameterValues("nwgfrz");
String[] sdgfrz=request.getParameterValues("sdgfrz");
String[] yqgfrz=request.getParameterValues("yqgfrz");
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String mgfrzs="";
	String nwgfrzs="";
	String sdgfrzs="";
	String yqgfrzs="";

	conn.setAutoCommit(false);

	ls_sql=" delete from  crm_grxx where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//1、木工 2、泥瓦工 3、水电工 4、油漆工
	if(mgfrz!=null)
	{
		for(int i=0; i<mgfrz.length ;i++)
		{
			if (!cf.GB2Uni(mgfrz[i]).equals(""))
			{
				ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm) ";
				ls_sql+=" values (?,'木工',?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,cf.GB2Uni(mgfrz[i]));
				ps.executeUpdate();
				ps.close();

				mgfrzs+="、"+cf.GB2Uni(mgfrz[i]);
			}
			
		}
	}
	
	if(nwgfrz!=null)
	{
		for(int i=0; i<nwgfrz.length ;i++)
		{
			if (!cf.GB2Uni(nwgfrz[i]).equals(""))
			{
				ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm) ";
				ls_sql+=" values (?,'泥瓦工',?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,cf.GB2Uni(nwgfrz[i]));
				ps.executeUpdate();
				ps.close();

				nwgfrzs+="、"+cf.GB2Uni(nwgfrz[i]);
			}
		}
	}

	if(sdgfrz!=null)
	{
		for(int i=0; i<sdgfrz.length ;i++)
		{
			if (!cf.GB2Uni(sdgfrz[i]).equals(""))
			{
				ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm) ";
				ls_sql+=" values (?,'水电工',?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,cf.GB2Uni(sdgfrz[i]));
				ps.executeUpdate();
				ps.close();

				sdgfrzs+="、"+cf.GB2Uni(sdgfrz[i]);
			}
		}
	}

	if(yqgfrz!=null)
	{
		for(int i=0; i<yqgfrz.length ;i++)
		{
			if (!cf.GB2Uni(yqgfrz[i]).equals(""))
			{
				ls_sql=" insert into crm_grxx (khbh ,grgz ,grxm) ";
				ls_sql+=" values (?,'油漆工',?) ";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,khbh);
				ps.setString(2,cf.GB2Uni(yqgfrz[i]));
				ps.executeUpdate();
				ps.close();

				yqgfrzs+="、"+cf.GB2Uni(yqgfrz[i]);
			}
		}
	}

	int grsl=0;
	if (!mgfrzs.equals(""))
	{
		grsl++;
		mgfrzs=mgfrzs.substring(1);
	}
	if (!nwgfrzs.equals(""))
	{
		grsl++;
		nwgfrzs=nwgfrzs.substring(1);
	}
	if (!sdgfrzs.equals(""))
	{
		grsl++;
		sdgfrzs=sdgfrzs.substring(1);
	}
	if (!yqgfrzs.equals(""))
	{
		grsl++;
		yqgfrzs=yqgfrzs.substring(1);
	}
	
	String pgrbz="";//1：未派；2：派工人完成；3：审核完成；4：派部分工人；5：部分审核
	if (grsl>=4)
	{
		pgrbz="2";
	}
	else if (grsl<=0)
	{
		pgrbz="1";
	}
	else{
		pgrbz="4";
	}

	String pgrshbz="";//1：未审核；2：审核
	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"' and shsj is null";
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
		pgrshbz="1";
	}
	else {
		pgrshbz="2";
	}

	ls_sql="update crm_khxx set mgfrz=?,nwgfrz=?,sdgfrz=?,yqgfrz=?,pgrbz=?,pgrshbz=?,pgrsj=SYSDATE ";//1：未派；2：派工人；3：审核
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mgfrzs);
	ps.setString(2,nwgfrzs);
	ps.setString(3,sdgfrzs);
	ps.setString(4,yqgfrzs);
	ps.setString(5,pgrbz);
	ps.setString(6,pgrshbz);
	ps.executeUpdate();
	ps.close();
	
	conn.commit();
	%>
	<SCRIPT language=javascript >
	<!--
	alert("派单成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>