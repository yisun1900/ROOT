<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String xjjlh=request.getParameter("xjjlh");

	ls_sql="SELECT '�޸�' xg,'ɾ��' sc,kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgsm";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"zgjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="EditKp_zggdmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"zgjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="DeleteKp_zggdmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>������Ŀ��ϸ(����¼�ţ�<%=xjjlh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�޸�</td>
	<td  width="4%">ɾ��</td>
	<td  width="8%">���ļ�¼��</td>
	<td  width="6%">����״̬</td>
	<td  width="7%">Ҫ����</td>
	<td  width="10%">��������</td>
	<td  width="5%">������</td>
	<td  width="56%">����˵��</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>