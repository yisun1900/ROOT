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
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ݿⱸ��]��"+xtrzyhmc+"') ";
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
		out.println("<BR>������������,Ŀ¼��"+path+"������");
		return;
	}

	String oldfile=path+"\\"+cf.addDay(-1)+".dmp";
	java.io.File backfile=new java.io.File(oldfile);
	if (!backfile.isFile())
	{
		out.println("<P><font color='#FF3333'><b>�������棬����ı����ļ���"+oldfile+"�����ڣ����ݱ��ݿ���������</b></font>");
	}
	oldfile=path+"\\"+cf.addDay(-2)+".dmp";
	backfile=new java.io.File(oldfile);
	if (!backfile.isFile())
	{
		out.println("<P><font color='#FF3333'><b>���������ؾ��棬ǰ��ı����ļ���"+oldfile+"�����ڣ����ݱ��ݿ���������</b></font>");
	}


	String today=cf.today();
	String filename=path+"\\"+today+".dmp";

	java.lang.Runtime rt=java.lang.Runtime.getRuntime();

	java.lang.Process p=null;
	byte[] b=new byte[200];

	String bfml="exp liyerp/liyerp BUFFER=4096 FILE="+filename;

	p=rt.exec(bfml);
//	out.println("<P>"+bfml);

	out.println("<P>�����ļ�Ϊ��"+filename+"............<P>���ڿ�ʼ�������ݣ����ݹ�����ϵͳ�ں�̨��ɣ�������������������");

}
catch (Exception e) {
	out.print("Exception: " + e.getMessage());
	return;
}
finally 
{
}

%>

