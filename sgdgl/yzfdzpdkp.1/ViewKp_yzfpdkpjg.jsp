<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String ssfgs=request.getParameter("ssfgs");

	ls_sql="SELECT '',kpsj,dwmc,sgdmc,(NVL(-1*sq_sgd.sgdpdjf,0)+NVL(sq_sgd.sgdwgjf,0)+NVL(pdkpf,0)+(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))) zf,sq_sgd.khmyd||'%',DECODE(tdbz,'Y','<font color=\"#FF0000\">��ͣ��</font>','N','����'),sgdjbmc,ROUND(sq_sgd.zbj/10000,1)||'��',sq_sgd.bzs,DECODE(kp_yzfpdkpjg.zbjsfdb,'Y','���','N','<font color=\"#FF0000\">��</font>'),NVL(sq_sgd.zdzsgds,0),NVL(sq_sgd.mqzsgds,0),(NVL(sq_sgd.zdzsgds,0)-NVL(sq_sgd.mqzsgds,0))||'��',sgdjbjf||'��',NVL(-1*sq_sgd.sgdpdjf,0)||'��',NVL(sq_sgd.sgdwgjf,0)||'��',xjgdpjkf,-1*xjgdjf||'��',gdyspjkf,-1*gdysjf||'��',wxtss,yztss,ybtss,qwtss,-1*tsjf||'��',yqgds,-1*yqgdjf||'��',aqsggsrs,aqsggwrs,-1*aqsgjf||'��' ";
	ls_sql+=" FROM kp_yzfpdkpjg,sq_sgd,sq_sgdjbbm,sq_dwxx  ";
    ls_sql+=" where kp_yzfpdkpjg.sgd=sq_sgd.sgd and kp_yzfpdkpjg.sgdjbbm=sq_sgdjbbm.sgdjbbm";
    ls_sql+=" and kp_yzfpdkpjg.ssfgs=sq_dwxx.dwbh";
    ls_sql+=" and  kp_yzfpdkpjg.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by kp_yzfpdkpjg.ssfgs,tdbz,kp_yzfpdkpjg.zbjsfdb desc,zf desc,sq_sgd.khmyd desc,sq_sgd.sgdjbbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�������¼�����򣺶ӳ���ֵ���ӳ��ͻ�����ȡ��ӳ�����</font></B>
</CENTER>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">����</td>
	<td  width="7%">����ʱ��</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="4%">ʩ����</td>
	<td  width="3%">�ܷ�</td>
	<td  width="3%">�ͻ������</td>
	<td  width="3%">ͣ��</td>
	<td  width="3%">ʩ���Ӽ���</td>
	<td  width="4%">�ʱ���</td>
	<td  width="3%">������</td>
	<td  width="3%">�ʱ�����</td>
	<td  width="3%">�����ʩ������</td>
	<td  width="3%">Ŀǰ��ʩ������</td>
	<td  width="3%"><strong><font color="#0000FF">����ʩ�������ӷ�</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">ʩ���Ӽ���ӷ�</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">ʩ�����ɵ�����</font></strong></td>
	<td  width="3%"><strong><font color="#0000FF">ʩ�����깤�ӷ�</font></strong></td>

	<td  width="3%">Ѳ�칤��ƽ���۷�</td>
	<td  width="3%"><strong><font color="#0000FF">Ѳ�칤�ؼ���</font></strong></td>
	<td  width="3%">��������ƽ���۷�</td>
	<td  width="3%"><font color="#0000FF"><strong>�������ռ���</strong></font></td>
	<td  width="3%">Σ��Ͷ�ߴ���</td>
	<td  width="3%">����Ͷ�ߴ���</td>
	<td  width="3%">һ��Ͷ�ߴ���</td>
	<td  width="3%">��΢Ͷ�ߴ���</td>
	<td  width="3%"><strong><font color="#0000FF">Ͷ�߼���</font></strong></td>
	<td  width="3%">���ڹ�����</td>
	<td  width="3%"><strong><font color="#0000FF">���ڹ��ؼ���</font></strong></td>
	<td  width="3%">��ȫ�¹ʹ�������</td>
	<td  width="3%">��ȫ�¹ʹ�������</td>
	<td  width="3%"><strong><font color="#0000FF">��ȫ�¹ʼ���</font></strong></td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate(true);
%> 
</table>

</body>
</html>