<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>��ĩ��ת</TITLE>
</HEAD>

<BODY bgColor=#ffffff>

<% 

String yhmc=(String)session.getAttribute("yhmc");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

String yjjzsj=cf.lastDay(nian,yue);

if (yjjzsj.compareTo(cf.today())>0)
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

java.sql.Date lastDay=null;

try {
	conn=cf.getConnection();

	java.sql.Date sqjzrq=null;
	int count=0;

	//��ѯ��cw_qmjz��[����ת����]��[��������]֮����·ݲ����޽�ת��¼����Ϊ-1
	ls_sql="select MONTHS_BETWEEN(  NVL(max(yjjzsj),ADD_MONTHS(TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),-1)),TO_DATE('"+yjjzsj+"','YYYY-MM-DD')),max(yjjzsj) ";
	ls_sql+="  from cw_qmjz";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);//����ת�����������ת���ڵĲ�� 
		sqjzrq=rs.getDate(2);//�����ݿ���ȡ����ת���� 
	} 
	rs.close();
	ps.close();


	String sqstr=null;
	if (sqjzrq==null)
	{
		sqstr="";
	}
	else{
		sqstr=sqjzrq.toString();
	}


	if (yjjzsj.equals(sqstr))
	{
		out.println("ʧ�ܣ����ڡ�"+yjjzsj+"���ѽ�ת��");
		return;
	}

	if (count>0)//������ڴ�������Ľ�ת����
	{
		out.println("ʧ�ܣ����ܽ�ת���µļ�¼��");
		return;
	}
	else if (count<-1)//�������С������Ľ�ת����
	{
		out.println("ʧ�ܣ������»�û�н�ת�����ܿ��½�ת��");
		return;
	}



	conn.setAutoCommit(false);

	String sjfw=cf.firstDay(nian,yue);
	String sjfw2=cf.lastDay(nian,yue);

	ls_sql="insert into cw_qmjz ( yjjzsj,jzr,sqjzrq) ";
	ls_sql+=" values ( TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.setDate(2,sqjzrq);
	ps.executeUpdate();
	ps.close();

	double jryjbfb=0;
	String dwbh=null;
	ls_sql="select dwbh,jryjbfb";
	ls_sql+="  from sq_dwxx";  
	ls_sql+="  where dwlx='F0' ";  
	ls_sql+="  order by dwbh";  
	ps1=conn.prepareStatement(ls_sql);  
	rs1=ps1.executeQuery();
	while (rs1.next())
	{
		dwbh=rs1.getString("dwbh"); 
		jryjbfb=rs1.getDouble("jryjbfb");//����ҵ���ٷֱ� 

		if (jryjbfb==0)
		{
			conn.rollback();
			out.println("<P>���󣡷ֹ�˾��"+dwbh+"���ޡ�����ҵ���ٷֱȡ������ڵ�λ��Ϣ����¼��");
			return;
		}

		jryjbfb=(jryjbfb-0.5)/100;


		//ǩ��
		ls_sql="insert into cw_qmjzmx (yjjzsj,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt in('2')";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
		ls_sql+=" and yjjzsj is null";//δ��ת�ĵ�������������
		ls_sql+=" and cwsfke>=qye*"+jryjbfb;
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	} 
	rs1.close();
	ps1.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt in('2') and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD') )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�˵�
	ls_sql="insert into cw_qmjzmx (yjjzsj,khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
	ls_sql+=" select TO_DATE('"+yjjzsj+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where zt='3'";
	ls_sql+=" and crm_khxx.yjjzsj is not null";
	ls_sql+=" and crm_khxx.tdyjjzsj is null";//δ��ת�ĵ�������������
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='2' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='2' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='3' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.yjjzsj=cw_qmjz.yjjzsj and cw_qmjzmx.zt='3' and cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD'))";
	ls_sql+=" where yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
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
	out.print("<BR>ls_sql="+ls_sql);
}
finally{
	conn.setAutoCommit(true);

	try{
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





