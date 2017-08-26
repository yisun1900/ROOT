<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='010405'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[数据库备份]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
String path=cf.GB2Uni(request.getParameter("path"));
try {
	java.io.File dir=new java.io.File(path);
	if (!dir.isDirectory())
	{
		out.println("<BR>！！！！错误,目录："+path+"不存在");
		return;
	}

	String oldfile=path+"\\"+cf.addDay(-1)+".dmp";
	java.io.File backfile=new java.io.File(oldfile);
	if (!backfile.isFile())
	{
		out.println("<P><font color='#FF3333'><b>！！警告，昨天的备份文件："+oldfile+"不存在，数据备份可能有问题</b></font>");
	}
	oldfile=path+"\\"+cf.addDay(-2)+".dmp";
	backfile=new java.io.File(oldfile);
	if (!backfile.isFile())
	{
		out.println("<P><font color='#FF3333'><b>！！！严重警告，前天的备份文件："+oldfile+"不存在，数据备份可能有问题</b></font>");
	}


	String today=cf.today();
	String filename=path+"\\"+today+".dmp";

	java.lang.Runtime rt=java.lang.Runtime.getRuntime();

	java.lang.Process p=null;
	byte[] b=new byte[200];

	String bfml="exp liyerp/liyerp BUFFER=4096 FILE="+filename;

	p=rt.exec(bfml);
//	out.println("<P>"+bfml);

	out.println("<P>备份文件为："+filename+"............<P>现在开始备份数据，备份工作由系统在后台完成，您可以做其他工作了");

}
catch (Exception e) {
	out.print("Exception: " + e.getMessage());
	return;
}
finally 
{
}

%>

