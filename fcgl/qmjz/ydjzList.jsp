<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML><HEAD>
<TITLE>��ת��ĩ���</TITLE>
<BODY bgColor=#ffffff>

<% //����ǰ�洫�����Ĳ���
String yhmc=(String)session.getAttribute("yhmc");

String wherejzrq=cf.GB2Uni(request.getParameter("jzrq"));
String dwbh=cf.GB2Uni(request.getParameter("fgs"));
String firstjzrq=wherejzrq.substring(0,7)+"-01";
String jzph=null;
String tem=null;
String tem2=null;
tem=wherejzrq.substring(0,4);
tem2=wherejzrq.substring(5,7);
jzph=dwbh+tem+tem2;

java.sql.Date jzrq=java.sql.Date.valueOf(wherejzrq);
if (jzrq.compareTo(cf.getDate())>0)
{
	out.println("ʧ�ܣ�[��ת����]���ܴ���[ϵͳ����]!");
	return;
}

//�������ݿ�
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;

String mackcrq=null;

java.sql.Date lastDay=null;

String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String cldlmc=null;
double fgsdj=0;
double cldj=0;
double byrksl=0;
double byrkje=0;
double bycksl=0;
double byckje=0;
double sumrksl=0;
double sumrkje=0;
double sumcksl=0;
double sumckje=0;
double kcsl=0;


long xh=0;
try {
	conn=cf.getConnection();

	java.sql.Date maxjzrq=null;
	int count=0;

	//��ѯ�����������
	ls_sql="select distinct last_day(TO_DATE('"+wherejzrq+"','yyyy-mm-dd')) from sq_cd ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		lastDay=rs.getDate(1);//�����ݿ���ȡ����ǰ������� 
	} 
	rs.close();
	ps.close();

	if (!jzrq.equals(lastDay))
	{
		out.println("ʧ�ܣ�����["+wherejzrq+"]���ǵ������һ�죬���ܽ�ת��");
		return;
	}
//��ѯ��cl_ydjz��[����ת����]��[��������]֮����·ݲ����޽�ת��¼����Ϊ-1
	ls_sql="select MONTHS_BETWEEN(NVL(max(jzrq), ADD_MONTHS(?,-1)),?),max(jzrq) ";
	ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,jzrq);
	ps.setDate(2,jzrq);
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//����ת�����������ת���ڵĲ�� 
		maxjzrq=rs.getDate(2);//�����ݿ���ȡ����ת���� 
	} 
	rs.close();
	ps.close();


	if (jzrq.equals(maxjzrq))
	{
		out.println("ʧ�ܣ��ѽ�ת��");
		return;
	}

	if (count>0)//������ڴ�������Ľ�ת����
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("ʧ�ܣ����ܽ�ת���µļ�¼��");
		window.close();
		//-->
		</SCRIPT>
		<%
		return;
	}
	else if (count<-1)//�������С������Ľ�ת����
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("ʧ�ܣ������»�û�н�ת�����ܿ��½�ת��");
		window.close();
		//-->
		</SCRIPT>
		<%
		return;
	}

	//��ѯ�����ڽ�ת���ڡ����ڿ������
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from cl_rkd  ";
	ls_sql+=" where cl_rkd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_rkd.rkzt='1' and rksj>? and rksj<=?";//ע����㲻��������
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		count=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	if (count>0)
	{
		out.println("ʧ��ת�ܣ�����ⵥδ�ύ�����ύ��ɾ����");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from cl_ckd  ";
	ls_sql+=" where cl_ckd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_ckd.ckzt='1' and cksj>? and cksj<=?";//ע����㲻��������
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		count=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	if (count>0)
	{
		out.println("ʧ��ת�ܣ��г��ⵥδ�ύ�����ύ��ɾ����");
		return;
	}

	conn.setAutoCommit(false);

	/*******************************************************\
	|		����ת���д�����ݿ�								|
	\*******************************************************/
	ls_sql="insert into cl_ydjz ( jzph,dwbh,sqjzrq,jzrq,jzr ) ";
	ls_sql+=" values ( ?,?,?,?,?) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.setString(1,jzph);
	ps1.setString(2,dwbh);
	ps1.setDate(3,sqjzrq);
	ps1.setDate(4,jzrq);
	ps1.setString(5,yhmc);
	ps1.executeUpdate();
	ps1.close();


	ls_sql="select cl_clbm.clbm,clmc,clgg,jldwmc,cldlmc ";
	ls_sql+=" from cl_clbm  ";
	ls_sql+=" order by  clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		clmc=rs.getString("clmc");
		clgg=rs.getString("clgg");
		jldwmc=rs.getString("jldwmc");
		cldlmc=rs.getString("cldlmc");

/***********************************************************\
|		��ѯ�����ڿ������								|
\***********************************************************/
		double sqkcsl=0;
		ls_sql="select kcsl ";
		ls_sql+=" from cl_ydjzmx ";
		ls_sql+=" where jzph='"+sqjzph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqkcsl=rs1.getDouble("kcsl");
		}
		rs1.close();
		ps1.close();


/***********************************************************\
|		��ѯ���´˲��ϵ����									|
\***********************************************************/
		ls_sql="select sum(rksl) byrksl";
		ls_sql+=" from cl_rkmx,cl_rkd  ";
		ls_sql+=" where cl_rkmx.rkph=cl_rkd.rkph and cl_rkmx.clbm='"+clbm+"' ";
		ls_sql+=" and cl_rkd.dwbh='"+dwbh+"' ";
		ls_sql+=" and cl_rkd.rkzt='2' and rksj>? and rksj<=?";//ע����㲻��������
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		ps1.setDate(2,jzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			byrksl=rs1.getDouble("byrksl");
		}
		rs1.close();
		ps1.close();


/***********************************************************\
|		��ѯ���´˲��ϵĳ���									|
\***********************************************************/
		ls_sql="select sum(cksl) bycksl ";
		ls_sql+=" from cl_ckmx,cl_ckd  ";
		ls_sql+=" where cl_ckmx.ckph=cl_ckd.ckph ";
		ls_sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckmx.leixing='1' ";
		ls_sql+=" and cl_ckd.dwbh='"+dwbh+"' ";
		ls_sql+=" and cl_ckd.ckzt='2' and cksj>? and cksj<=?";//ע����㲻��������
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		ps1.setDate(2,jzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bycksl=rs1.getDouble("bycksl");
		}
		rs1.close();
		ps1.close();


		kcsl=sqkcsl+byrksl-bycksl;

		if (kcsl!=0)
		{
	/*******************************************************\
	|		����ת���д�����ݿ�								|
	\*******************************************************/
			ls_sql="insert into cl_ydjzmx ( jzph,clbm,clmc,clgg,cldlmc   ,jldwmc,sqkcsl,rksl,cksl,kcsl) ";
			ls_sql+=" values ( ?,?,?,?,?  ,?,?,?,?,? ) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,jzph);
			ps1.setString(2,clbm);
			ps1.setString(3,clmc);
			ps1.setString(4,clgg);
			ps1.setString(5,cldlmc);
			ps1.setString(6,jldwmc);
			ps1.setDouble(7,sqkcsl);
			ps1.setDouble(8,byrksl);
			ps1.setDouble(9,bycksl);
			ps1.setDouble(10,kcsl);
			ps1.executeUpdate();
			ps1.close();
		}

	}

	ls_sql="update cl_rkd set jzph='"+jzph+"'";
	ls_sql+=" where cl_rkd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_rkd.rkzt='2' and rksj>? and rksj<=?";//ע����㲻��������
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	ps1.executeUpdate();
	ps1.close();

	ls_sql="update cl_ckd set jzph='"+jzph+"'";
	ls_sql+=" where cl_ckd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_ckd.ckzt='2' and cksj>? and cksj<=?";//ע����㲻��������
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	ps1.executeUpdate();
	ps1.close();
	
	rs.close();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("��ת�ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ��"+e);
	out.print("ls_sql="+ls_sql);
}
finally{
	try{
		conn.setAutoCommit(true);

		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close();  
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("�ر����ӷ�������,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




