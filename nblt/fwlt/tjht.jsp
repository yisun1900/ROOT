<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
int lch=0;
int ygbh=0;
String sfnmt=null;
String bkbh=null;
String tzbh=cf.GB2Uni(request.getParameter("tzbh"));
String hfnr=cf.GB2Uni(request.getParameter("editor_body"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);
	//��ѯԱ�����
	ls_sql=" select ygbh ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ygbh=rs.getInt("ygbh");
	}
	rs.close();
	ps.close();
	//���ɱ��
	ls_sql=" select NVL(max(lch),0)+1 lch ";
	ls_sql+=" from nblt_hfgl ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lch=rs.getInt("lch");
	}
	rs.close();
	ps.close();
	if (lch<=0)
	{lch=1;}
	//��ѯ�����
	ls_sql=" select bkbh ";
	ls_sql+=" from nblt_ftgl ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		bkbh=rs.getString("bkbh");
	}
	rs.close();
	ps.close();
	//��ѯ�Ƿ�������
	ls_sql=" select sfnmt ";
	ls_sql+=" from nblt_bkgl ";
	ls_sql+=" where bkbh='"+bkbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sfnmt=rs.getString("sfnmt");
	}
	rs.close();
	ps.close();
	if (sfnmt.equals("Y"))
	{
		ygbh=1;
	}

	////�������ӵĻظ���
	ls_sql="update nblt_ftgl set hfcs=hfcs+1,zhhfr=?,zhhfsj=sysdate ";
	ls_sql+=" where tzbh='"+tzbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ygbh);
	ps.executeUpdate();
	ps.close();

	////�������ӵĻظ���
	ls_sql="update nblt_bkgl set hfs=hfs+1 ";
	ls_sql+=" where bkbh='"+bkbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//�༭�������� �����ͼƬ���޸�
	//ȡ�õ�ǰurl
	String[] allurl=new String[3];
   String  dqurl   =  request.getHeader("referer");
   String mms=":8090";
   String str1="";
   String str2="";
   String wherestr1="href=\"";
   String wherestr2="src=\"";
   //��ȡ��ַ
   int firasdk=dqurl.indexOf(mms)+5;
   dqurl=dqurl.substring(0,firasdk);
   allurl[0]=dqurl;
   allurl[1]="http://127.0.0.1:8090";
   allurl[2]="http://localhost:8090";

//ȥ��url
  for (int kks=0;kks<allurl.length;kks++)
	{
	  str1=wherestr1+allurl[kks];
	  str2=wherestr2+allurl[kks];
	  hfnr=hfnr.replaceAll(str1,wherestr1);
	  hfnr=hfnr.replaceAll(str2,wherestr2);
  }

	ls_sql="insert into nblt_hfgl ( tzbh,lch,hfr,hfsj,zhxgsj,hfnr,yhfnr ) ";
	ls_sql+=" values ( ?,?,?,SYSDATE,SYSDATE,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzbh);
	ps.setInt(2,lch);
	ps.setInt(3,ygbh);
	ps.setString(4,hfnr);
	ps.setString(5,hfnr);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>����ʧ�ܣ�");
		return;
	}
	else
	{	}
	if (ps!= null) ps.close(); 
	conn.commit();
	%>
		<SCRIPT language=javascript >
		<!--
		alert("�ظ��ɹ���");
		window.location.href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>&ys=1";
//		window.close();
		//-->
		</SCRIPT>
		<br><a href="cktz.jsp?tzbh=<%=tzbh%>&yhdlm=<%=yhdlm%>&ygbh=<%=ygbh%>">������ĵ������û���Զ���ת���������</a>
		<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql+"==="+tzbh+"==="+hfnr);
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