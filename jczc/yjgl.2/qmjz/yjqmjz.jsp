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
int count=0;

count=cf.checkYjQmjz("cw_qmjz");
//���أ� -1:����;0:��ȫ����ת��1:ֻ�����һ��δ��ת;2:�����������δ��ת
if (count==0)
{
	out.println("����ȫ���ѽ�ת��δ���µĽ�תʱ�䣡");
	return;
}
else if (count==-1)
{
	out.println("ϵͳ����");
	return;
}

String yhmc=(String)session.getAttribute("yhmc");

String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

String jzrq=cf.lastDay(nian,yue);


//�������ݿ�
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;


try {
	conn=cf.getConnection();

	//���أ� -1:����;0:�����ѽ�ת��1:�����ѽ�ת������δ��ת;2:����δ��ת;3:��תʱ�䲻�ܳ�������  
	count=cf.checkQmjz("cw_qmjz",jzrq);

	if (count==0)//�ѽ�ת
	{
		out.println("ʧ�ܣ����ڡ�"+jzrq+"���ѽ�ת��");
		return;
	}
	else if (count==2)//����û��ת
	{
		out.println("ʧ�ܣ������»�û�н�ת�����ܿ��½�ת��");
		return;
	}
	else if (count==3)//��תʱ�䲻�ܳ�������
	{
		out.println("ʧ�ܣ���תʱ�䲻�ܳ������죡");
		return;
	}
	else if (count==-1)
	{
		out.println("ϵͳ����");
		return;
	}



	conn.setAutoCommit(false);


	ls_sql="insert into cw_qmjz ( jzrq,jzr,czsj,sqjzrq) ";
	ls_sql+=" values ( TO_DATE('"+jzrq+"','YYYY-MM-DD'),?,SYSDATE,TRUNC(LAST_DAY(ADD_MONTHS(TO_DATE('"+jzrq+"','YYYY-MM-DD'),-1)))) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yhmc);
	ps.executeUpdate();
	ps.close();

	int yjjzrq=0;
	String qyrqstr=null;
	ls_sql="select yjjzrq";
	ls_sql+="  from sq_dwxx";  
	ls_sql+="  where dwlx='A0' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		yjjzrq=rs.getInt("yjjzrq");//����ҵ���Ľ������� 
	} 
	rs.close();
	ps.close();

	if (yjjzrq==0)//0��ʾÿ�µ����һ��
	{
		qyrqstr=cf.lastDay(nian,yue);
	}
	else{
		qyrqstr=nian+"-"+yue+"-"+cf.addZero(yjjzrq,2);
	}


	//ȡǩ���ͻ�
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
		jryjbfb=rs1.getDouble("jryjbfb");//��װ�ͻ�����ҵ���տ���� 

		if (jryjbfb<0)
		{
			conn.rollback();
			out.println("<P>���󣡷ֹ�˾��"+dwbh+"���ޡ���װ�ͻ�����ҵ���տ�����������ڵ�λ��Ϣ����¼��");
			return;
		}

		jryjbfb=(jryjbfb-0.5)/100;

		//��װ�ͻ�ǩ��
		ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='2'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
		ls_sql+=" and yjjzsj is null";//δ��ת�ĵ�������������
		ls_sql+=" and cwsfke>=qye*"+jryjbfb;
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//��ƿͻ�ǩ��
		ls_sql="insert into cw_qmjzmx (jzrq              ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt='5'";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
		ls_sql+=" and yjjzsj is null";//δ��ת�ĵ�������������
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//�˵��ͻ�����ǩ����ת
		ls_sql="insert into cw_qmjzmx (jzrq               ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
		ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,'2',khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where zt in('3')";//2����װ�ͻ���3���˵��ͻ���4�����ɿͻ���5����ƿͻ�
		ls_sql+=" and yjjzsj is null";//δ��ת�ĵ�������������
		ls_sql+=" and fgsbh='"+dwbh+"'";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	} 
	rs1.close();
	ps1.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD') )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//�˵�
		ls_sql="insert into cw_qmjzmx (jzrq          ,khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh)";
	ls_sql+=" select TO_DATE('"+jzrq+"','YYYY-MM-DD'),khbh,zt,khxm,hth,sjs,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,zqguanlif,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,kglf,kqtk,cxhdbm,cxhdbmxq,cxhdbmzh,qyrq,tdsj,sgd,zjxm,fwmj,jzbz,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,fgsbh,dwbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where zt='3'";
	ls_sql+=" and crm_khxx.yjjzsj is not null";//��ʾ�Ѽ����ҵ��
	ls_sql+=" and crm_khxx.tdyjjzsj is null";//��ʾδ�˵���ת
	ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+qyrqstr+"','YYYY-MM-DD')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update crm_khxx";
	ls_sql+=" set tdyjjzsj=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
	ls_sql+=" where khbh in(select khbh from cw_qmjzmx where zt='3' and jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update cw_qmjz set khzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,qyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt!='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdkhzs=(select count(*) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" ,tdqyze=(select sum(qye) from cw_qmjzmx where cw_qmjzmx.jzrq=cw_qmjz.jzrq and cw_qmjzmx.zt='3' and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD'))";
	ls_sql+=" where jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')";
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




