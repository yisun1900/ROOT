<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String gdjsjlh=request.getParameter("gdjsjlh");

	String ls_sql=null;

	ls_sql="SELECT kp_xjgdjl.xjjlh,sgdmc,crm_khxx.khxm,fkze,kp_xjgdjl.xjr,kp_xjgdjl.xjsj,xjlxmc,DECODE(cfspbz,'2','δ����','3','����ͨ��','4','����δͨ��'),DECODE(kp_xjgdjl.kpbz,'N','δ����','Y','�ѿ���'),DECODE(kp_xjgdjl.jsbz,'N','δ����','Y','�ѽ���'),kp_xjgdjl.bz ";
	ls_sql+=" FROM kp_xjgdjl,crm_khxx,sq_sgd,kp_xjlxbm  ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and kp_xjgdjl.khbh=crm_khxx.khbh and kp_xjgdjl.xjlxbm=kp_xjlxbm.xjlxbm";
    ls_sql+=" and kp_xjgdjl.jsjlh='"+gdjsjlh+"' ";
    ls_sql+=" order by kp_xjgdjl.xjjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"xjjlh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/gcgl/zjygl/xjgd/ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����¼�������¼�ţ�<%=gdjsjlh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">������¼��</td>
	<td  width="6%">ʩ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="8%">�����ܶ�</td>
	<td  width="5%">������</td>
	<td  width="8%">����ʱ��</td>
	<td  width="9%">��������</td>
	<td  width="6%">������־</td>
	<td  width="6%">������־</td>
	<td  width="6%">�����־</td>
	<td  width="33%">�������˵��</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>